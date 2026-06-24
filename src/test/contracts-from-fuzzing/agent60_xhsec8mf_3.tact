contract Test {
    flag: Int = 0;

    // Empty message receiver
    receive() {
        self.flag = 1;
    }

    // Trigger using get function
    get fun trigger(): Int {
         return self.flag;
    }
}
