struct Layer2 {
    bar: Int;
}

struct Layer1 {
    foo: Layer2;
}

contract StructToField {
    baz: Layer1;
    init() {
        self.baz = Layer1 { foo: Layer2{ bar: 123 } };
    }
    receive() {}
}