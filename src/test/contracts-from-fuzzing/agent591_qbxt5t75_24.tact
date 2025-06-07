struct MixNestedOpt {
    a: Int?;
    b: Inner?;
}

struct Inner {
    c: Int;
    d: String?;
}

contract MixNestedOptTest {
    s: MixNestedOpt;
    init() {
        self.s = MixNestedOpt{
            a: null,
            b: Inner{
                c:7,
                d:"qq"
            }
        };
    }
}