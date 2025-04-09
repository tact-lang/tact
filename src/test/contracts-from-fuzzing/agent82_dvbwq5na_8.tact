contract Test {
    flag: Int = 0;

    // Receiver for specific text "hello"
    receive("hello") {
        self.flag = 1;
    }

    // Receiver for specific text "world"
    receive("world") {
        self.flag = 2;
    }

    get fun getFlag(): Int {
        return self.flag;
    }
}
