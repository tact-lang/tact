struct NestedStruct {
    a: Int;
    b: Bool;
}

contract TestContract {
    foo: Int = 1;
    bar: Bool = true;
    s: NestedStruct;

    init() {
        self.s = NestedStruct{ a: 123, b: false };
    }
}