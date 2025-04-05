contract TestNull {
    // This function tests the 'null' literal as an optional integer
    fun test_null(): Int? {
         return null;
    }

    receive() {
         dump(self.test_null());
    }
}
