struct InnerMost {
    x: Int;
    y: Bool;
}

struct Middle {
    m: InnerMost;
    flag: Bool;
}

struct Outer {
    o: Middle;
    num: Int;
}

contract DeepChain {
    data: Outer;
    init() {
        self.data = Outer{
            o: Middle{ m: InnerMost{ x: 123, y: true }, flag: false },
            num: 456
        };
    }
}