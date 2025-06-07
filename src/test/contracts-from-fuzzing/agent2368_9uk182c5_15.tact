struct Layer1 {
    a: Int;
    b: Int;
}

struct Layer2 {
    layer1a: Layer1;
    layer1b: Layer1;
}

struct Layer3 {
    inner: Layer2;
}

contract TripleNest {
    storage: Layer3;

    init() {
        self.storage = Layer3{
            inner: Layer2{
                layer1a: Layer1{ a: 1, b: 2 },
                layer1b: Layer1{ a: 3, b: 4 }
            }
        };
    }
}