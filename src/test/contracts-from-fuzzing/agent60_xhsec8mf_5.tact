contract Test {
    flag: Int = 0;

    // Typed text receiver: accepts a String parameter
    receive(str: String) {
        // For test, set flag to 2 irrespective of actual string
        self.flag = 2;
    }

    // Trigger using getter function
    get fun trigger(): Int {
        return self.flag;
    }
}
