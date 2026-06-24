struct StrNest {
    a: String;
    b: String;
    s: SubS;
}

struct SubS {
    sub1: String;
    sub2: String;
}

contract NestedStrings {
    val: StrNest;
    init() {
        self.val = StrNest{
            a:"hello",
            b:"world",
            s: SubS{
                sub1:"foo",
                sub2:"bar"
            }
        };
    }
}