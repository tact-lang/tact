struct SimpleStruct { x: Int; }

contract TestContract {
    foo: SimpleStruct;

    init() {
        self.foo = SimpleStruct{ x: 42 };
    }
}