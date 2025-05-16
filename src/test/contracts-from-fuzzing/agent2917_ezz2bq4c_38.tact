struct A {
    foo: Int;
    bar: Bool;
}

contract StructMultiplePrimitive {
    item: A;

    init() {
        self.item = A{foo: 1, bar: true};
    }
}
