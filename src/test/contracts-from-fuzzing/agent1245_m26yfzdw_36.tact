struct Layer1 {
    foo: Int;
    bar: Layer2;
}

struct Layer2 {
    baz: Int;
    qux: Bool;
}

contract NestedLayers {
    v: Layer1;

    init() {
        self.v = Layer1{
            foo: 5,
            bar: Layer2{
                baz: 10,
                qux: false
            }
        };
    }
}
