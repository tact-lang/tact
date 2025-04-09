struct Layer1 {
    a: Int;
    b: Layer2;
}

struct Layer2 {
    c: Int;
    d: Layer3;
}

struct Layer3 {
    e: Int;
    f: Layer4;
}

struct Layer4 {
    g: Int;
}

contract Deep4Nest {
    l1: Layer1;

    init() {
        self.l1 = Layer1{
            a: 1,
            b: Layer2{
                c: 2,
                d: Layer3{
                    e: 3,
                    f: Layer4{
                        g: 4,
                    },
                },
            },
        };
    }
}