struct Layer3 {
    d: Int;
}

struct Layer2 {
    c: Layer3;
}

struct Layer1 {
    b: Layer2;
}

contract ChainDeep {
    a: Layer1;

    init() {
        self.a = Layer1{
            b: Layer2{
                c: Layer3{ d: 55 }
            }
        };
    }
}