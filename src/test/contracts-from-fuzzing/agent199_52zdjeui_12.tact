struct VeryDeepNested4 {
    e: Int;
}

struct VeryDeepNested3 {
    d: VeryDeepNested4;
}

struct VeryDeepNested2 {
    c: VeryDeepNested3;
}

struct VeryDeepNested1 {
    b: VeryDeepNested2;
}

contract VeryDeeplyNested {
    a: VeryDeepNested1;

    init() {
        self.a = VeryDeepNested1{
            b: VeryDeepNested2{
                c: VeryDeepNested3{
                    d: VeryDeepNested4{
                        e: 5,
                    },
                },
            },
        };
    }
}