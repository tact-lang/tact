contract Test {
    flag: Int = 0;

    // Specific text receiver for "hello"
    receive("hello") {
        self.flag = 1;
    }

    // Arbitrary text receiver for any other text messages
    receive(str: String) {
        self.flag = 2;
    }

    get fun getFlag(): Int {
        return self.flag;
    }
}
