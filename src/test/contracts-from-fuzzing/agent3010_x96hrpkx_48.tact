struct Inner { x: Int; y: Int = 5; }

contract StructPartialInit {
    foo: Inner;

    init() {
        self.foo = Inner{ x: 1 };
    }
}
