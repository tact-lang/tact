struct S1 {
    a: Int;
    b: Bool;
    c: String;
}

struct S2 {
    d: Int;
    e: S1;
    f: String;
}

contract MixedNested {
    val: S2;

    init() {
        self.val = S2{
            d: 1,
            e: S1{ a: 2, b: true, c: "x" },
            f: "y"
        };
    }
}