struct InnerMost {
    a: Int;
    b: Bool;
    c: String;
}

struct Middle {
    i: Int?;
    inner: InnerMost?;
}

struct Outer {
    flag: Bool;
    middle: Middle?;
}

contract OptionLayers {
    data: Outer;

    init() {
        self.data = Outer{
            flag: true,
            middle: null
        };
    }
}

contract Ref {
    receive() {
        let dummy: OptionLayers? = null;
    }
}