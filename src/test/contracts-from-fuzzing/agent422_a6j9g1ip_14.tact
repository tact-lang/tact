struct InnerS {
    a: Int;
    b: Bool;
}

struct OuterS {
    i: Int;
    s: String;
    inner: InnerS;
}

contract NestedStructs {
    val: OuterS;

    init() {
        self.val = OuterS{
            i: 10,
            s: "abc",
            inner: InnerS{ a: 1, b: false }
        };
    }
}