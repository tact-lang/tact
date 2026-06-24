struct NestedInner {
    innerVal: Int;
}

struct Outer {
    a: Int;
    b: Bool;
    c: NestedInner;
    d: String;
}

contract Test3 {
    val: Outer;

    init() {
        self.val = Outer{
            a: 5,
            b: false,
            c: NestedInner{ innerVal: 42 },
            d: "yay"
        };
    }
}