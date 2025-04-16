struct InnerMost {
    x: Int;
}

struct Mid {
    im: InnerMost;
    y: Int;
}

struct Outer {
    mid: Mid;
    z: Bool;
}

contract DeepNested {
    data: Outer = Outer{
        mid: Mid{ im: InnerMost{ x:5 }, y:6 },
        z: true
    };
}