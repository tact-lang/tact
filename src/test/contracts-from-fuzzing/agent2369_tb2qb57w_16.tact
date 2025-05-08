struct InnerMost {
    x:Int;
}

struct MidLayer {
    i:Int;
    inner: InnerMost;
}

struct OuterLayer {
    f:Int;
    nested: MidLayer;
}

contract DeepCombo {
    a: Int = 5;
    b: OuterLayer;
    c: String = "abc";
    init() {
        self.b = OuterLayer{
            f: 9,
            nested: MidLayer{
                i: 11,
                inner: InnerMost{ x: 42 }
            }
        };
    }
}