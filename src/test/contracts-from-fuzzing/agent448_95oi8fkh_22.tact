struct ZeroInit {
    foo: Int;
    bar: Bool;
}

contract ZeroInitContract {
    foo: Int;
    bar: Bool;

    init() {
        self.foo = 0;
        self.bar = false;
    }

    receive() {}
}