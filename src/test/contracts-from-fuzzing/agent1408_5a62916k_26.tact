contract DeepMixed {
    a: Int;
    opt1: Nested1?;

    init() {
        self.a = 1;
        self.opt1 = Nested1{
            b: 2,
            opt2: Nested2{
                c: 3,
                opt3: false,
            }
        };
    }
}

struct Nested1 {
    b: Int;
    opt2: Nested2?;
}

struct Nested2 {
    c: Int;
    opt3: Bool?;
}