struct Outer {
    inner: Inner;
}

struct Inner {
    deeper: Deeper;
}

struct Deeper {
    a: Int;
    b: Bool;
    c: String;
}

contract NestedCombo {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                deeper: Deeper{
                    a: 42,
                    b: true,
                    c: "yay"
                }
            }
        };
    }
}