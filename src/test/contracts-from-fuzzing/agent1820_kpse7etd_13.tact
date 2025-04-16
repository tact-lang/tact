struct S1 {
    x: Int?;
    y: Bool?;
}

struct S2 {
    s1: S1?;
    flag: Bool;
}

contract DeeplyOptional {
    field: S2?;
    init() {
        self.field = S2{
            s1: S1{
                x: null,
                y: true,
            },
            flag: false,
        };
    }
}