contract Foo {
    optBool: Bool?;

    init() {
        self.optBool = null;
    }

    receive() {
        self.optBool = !self.optBool!!;
    }
}