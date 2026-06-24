struct Layer1 {
    foo: Layer2;
}

struct Layer2 {
    bar: Layer3;
}

struct Layer3 {
    baz: Int;
}

contract Test {
    store: Layer1;

    init() {
        self.store = Layer1{
            foo: Layer2{
                bar: Layer3{
                    baz: 7
                }
            }
        };
    }
}
