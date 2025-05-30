struct MixedNest {
    a: Int;
    b: Inner1?;
}

struct Inner1 {
    c: String;
    d: Inner2;
}

struct Inner2 {
    e: Bool;
    f: String?;
}

contract MixedNestContract {
    data: MixedNest;
    init() {
        self.data = MixedNest{
            a: 3,
            b: Inner1{
                c: "hi",
                d: Inner2{
                    e: true,
                    f: null
                }
            }
        };
    }
}