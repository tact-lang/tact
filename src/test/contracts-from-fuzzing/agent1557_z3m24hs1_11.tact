struct Inner {
    s: String;
    b: Bool?;
}

struct Middle {
    n: Int;
    i: Inner;
}

struct Outer {
    f: Middle?;
}

contract ComboOptionalNested {
    data: Outer;

    init() {
        self.data = Outer{
            f: Middle{
                n: 1,
                i: Inner{ s: "hi", b: null }
            }
        };
    }
}