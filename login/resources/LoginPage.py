from PageObjectLibrary import PageObject

class LoginPage(PageObject):
    PAGE_URL = "/login"

    _locators = {
        "username": "id=username",
        "password": "id=password",
        "form_id":  "login"
    }

    def _is_current_page(self):
        # this site uses the same title for many pages,
        # so we can't rely on the default implementation
        # of this function. Instead, we'll check the page
        # location, and raise an appropriate error if
        # we are not on the correct page
        location = self.se2lib.get_location()
        if not location.endswith(self.PAGE_URL):
            message = "Expected location to end with " + \
                      self.PAGE_URL + " but it did not"
            raise Exception(message)
        return True

    def enter_username(self, username):
        """Type the given text into the username field """
        self.se2lib.input_text(self.locator.username, username)

    def enter_password(self, password):
        """Type the given text into the password field"""
        self.se2lib.input_text(self.locator.password, password)

    def click_the_login_button(self):
        """Clicks the submit button on the form

        For illustrative purposes, this uses the low level selenium
        functions for submitting the form
        """

        form = self.browser.find_element_by_xpath("//form[@id='%s']" % self.locator.form_id)

        # since this action causes the page to be refreshed, wrap
        # this in a context manager so it does't return until the
        # new page is rendered

        with self._wait_for_page_refresh():
            form.submit()