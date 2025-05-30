struct VeryDeep {
    level: Int = 5;
}

struct L4 {
    d: VeryDeep;
}

struct L3 {
    c: L4;
}

struct L2 {
    b: L3;
}

struct L1 {
    a: L2;
}

contract DeepNestedStructs {
    field: L1;

    init() {
        self.field = L1{
            a: L2{
                b: L3{
                    c: L4{
                        d: VeryDeep{
                            level: 99,
                        },
                    },
                },
            },
        };
    }
}