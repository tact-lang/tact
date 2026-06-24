struct Layer3 {
    a: Int;
}

struct Layer2 {
    a: Int;
    b: Layer3;
}

struct Layer1 {
    a: Int;
    b: Layer2;
}

contract TestContract {
    nested: Layer1;

    init() {
        self.nested = Layer1{
            a: 1,
            b: Layer2{
                a: 2,
                b: Layer3{a:3},
            },
        };
    }
}