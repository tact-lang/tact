contract Foo {
    myBool: Bool;
    init() {
        self.myBool = true;
    }

    receive() {
        self.myBool = false;
    }
}