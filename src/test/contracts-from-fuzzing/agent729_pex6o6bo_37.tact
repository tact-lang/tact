struct TinyNested {
    a: Int as uint4;
    b: Bool;
}

contract TinySerial {
    foo: TinyNested;

    init() {
        self.foo = TinyNested{a: 15, b: true};
    }

    receive() {}
}