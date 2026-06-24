contract TestString {
    // This function tests a string literal with escape sequences
    fun test_string(): String {
         return "Hello, \nWorld!";
    }

    receive() {
         dump(self.test_string());
    }
}
