struct Base {
    a: Int;
}

struct Layer1 {
    a: Base;
    b: Int;
}

struct Layer2 {
    a: Layer1;
    b: Base;
}

contract EdgeNest {
    s: Layer2;
    init() {
        self.s = Layer2{
            a: Layer1{
                a: Base{a: 1},
                b: 2
            },
            b: Base{a:3}
        };
    }
}