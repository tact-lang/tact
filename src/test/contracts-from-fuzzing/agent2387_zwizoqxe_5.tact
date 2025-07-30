struct DeeplyNested {
    s: Sub1;
}

struct Sub1 {
    s: Sub2;
}

struct Sub2 {
    s: Sub3;
}

struct Sub3 {
    val: Int?;
}

contract DeepNestContract {
    nested: DeeplyNested;
    init() {
        self.nested = DeeplyNested{
            s: Sub1{
                s: Sub2{
                    s: Sub3{
                        val: 7,
                    },
                },
            },
        };
    }
}