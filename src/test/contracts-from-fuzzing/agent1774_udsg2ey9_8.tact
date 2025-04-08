struct Layer4 {
    n: Int;
}

struct Layer3 {
    next: Layer4;
}

struct Layer2 {
    next: Layer3;
}

struct Layer1 {
    next: Layer2;
}

contract Test {
    nested: Layer1;

    init() {
        self.nested = Layer1{
            next: Layer2{
                next: Layer3{
                    next: Layer4{
                        n: 123,
                    },
                },
            },
        };
    }
}