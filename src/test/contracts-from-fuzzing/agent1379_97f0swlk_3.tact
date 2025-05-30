struct S1 {
    f1: Int?;
    f2: Bool?;
    f3: Address?;
    f4: Cell?;
}

struct S2 {
    nest: S1;
    opt: S1?;
}

contract OptionalNested {
    s2: S2;

    init() {
        self.s2 = S2{
            nest: S1{
                f1: 1,
                f2: true,
                f3: null,
                f4: null
            },
            opt: null
        };
    }
}
