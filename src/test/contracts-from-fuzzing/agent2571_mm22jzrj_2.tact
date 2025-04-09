struct S1 {
    a: Int;
    b: String;
    c: Bool;
}

struct S2 {
    s1: S1;
    d: String?;
    e: Bool?;
}

contract Combo {
    field: S2;

    init() {
        self.field = S2{
            s1: S1{
                a: 0,
                b: "",
                c: true,
            },
            d: null,
            e: false,
        };
    }
}
