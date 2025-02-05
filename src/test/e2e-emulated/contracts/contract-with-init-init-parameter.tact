struct Init { foo: Int as uint8 }

contract Test {
    foo: Int;

    init(init: Init) {
        self.foo = init.foo;
    }

    receive() {}

    get fun data(): Int {
        return self.foo;
    }
}
