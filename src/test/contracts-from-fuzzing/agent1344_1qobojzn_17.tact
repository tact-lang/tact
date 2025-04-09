struct S1 {
    i: Int;
}

struct S2 {
    s1: S1;
    optInt: Int?;
    optBool: Bool?;
    str: String;
}

contract NestedDifferent {
    rec: S2;

    init() {
        self.rec = S2{
            s1: S1{i:999},
            optInt: null,
            optBool: true,
            str: "ok"
        };
    }
}
