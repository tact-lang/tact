struct TwiceNested {
    a: InnerOne;
    b: InnerTwo;
}

struct InnerOne {
    foo: Int;
    bar: Bool;
}

struct InnerTwo {
    w: Int?;
    z: String;
}

contract DoubleNested {
    val: TwiceNested;

    init() {
        self.val = TwiceNested{
            a: InnerOne{ foo:1, bar:false },
            b: InnerTwo{ w:null, z:"hey" }
        };
    }
}