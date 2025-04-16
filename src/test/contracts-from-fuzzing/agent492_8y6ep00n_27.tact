contract Foo {
    option: Int?;

    init() {
        self.option = null;
    }

    receive() {
        if (self.option == null) {
            self.option = 5;
        } else {
            self.option = null;
        }
    }
}