struct S1 {
    a: Int = 1;
    b: String?;
}

struct S2 {
    s1_1: S1 = S1{};
    s1_2: S1 = S1{};
}

struct S3 {
    s2_1: S2 = S2{};
    s2_2: S2 = S2{};
}

contract DeepWideNest {
    deep: S3 = S3{};

    init() {
        self.deep = S3{
            s2_1: S2{
                s1_1: S1{a: 111, b: "foo"},
                s1_2: S1{a: 222, b: "bar"}
            },
            s2_2: S2{
                s1_1: S1{a: 333, b: "baz"},
                s1_2: S1{a: 444, b: "qux"}
            }
        };
    }
}