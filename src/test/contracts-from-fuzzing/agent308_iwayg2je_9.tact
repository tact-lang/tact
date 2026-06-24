struct Layer3 {
    d: Int;
}

struct Layer2 {
    c: Layer3;
}

struct Layer1 {
    b: Layer2;
}

contract MultiLayer {
    nested: Layer1;

    init() {
        self.nested = Layer1{b: Layer2{c: Layer3{d: 42}}};
    }
}