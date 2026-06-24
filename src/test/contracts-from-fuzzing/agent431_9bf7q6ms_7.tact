struct Inner1 { a: Int; }
struct Inner2 { b: Int; }
struct Inner3 { c: Int; }
struct BigWrap {
    f1: Inner1;
    f2: Inner2;
    f3: Inner3;
    d: Int;
    s: String;
    b: Bool;
}

contract NestedFieldsMix {
    val: BigWrap;

    init() {
        self.val = BigWrap{
            f1: Inner1{ a: 1 },
            f2: Inner2{ b: 2 },
            f3: Inner3{ c: 3 },
            d: 4,
            s: "hi",
            b: true
        };
    }
}
