struct LargeNested {
    a: Int;
    b: Bool;
    c: Inner1;
    d: Inner2;
}

struct Inner1 {
    s: String;
    f: Bool?;
}

struct Inner2 {
    s: Inner3;
}

struct Inner3 {
    x: Int;
    y: String?;
}

contract LargeNestedContract {
    s: LargeNested;

    init() {
        self.s = LargeNested{
            a: 123,
            b: true,
            c: Inner1{
                s: "abc",
                f: null,
            },
            d: Inner2{
                s: Inner3{
                    x: 7,
                    y: "yo",
                }
            }
        };
    }
}
