struct Deep3 {
    dval: Int?;
}

struct Deep2 {
    cval: Deep3;
}

struct Deep1 {
    bval: Deep2;
}

struct Root {
    aval: Deep1;
}

contract DeepNested {
    field: Root;
    init() {
        self.field = Root{
            aval: Deep1{
                bval: Deep2{
                    cval: Deep3{
                        dval: null,
                    },
                },
            },
        };
    }
}
