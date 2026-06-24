contract Test {
    flag: Int = 0;

    // Specific text message receiver
    receive("hello") {
        self.flag = 10;
    }

    get fun trigger(): Int {
         return self.flag;
    }
}
