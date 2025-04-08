struct Mid {
    x: Int;
    y: String?;
}

struct Outer {
    m1: Mid;
    m2: Mid;
    s: String;
    b: Bool;
}

contract MixedDeepWide {
    data: Outer;

    init() {
        self.data = Outer{
            m1: Mid{ x:1, y:null },
            m2: Mid{ x:2, y:"hi" },
            s: "test",
            b: true
        };
    }
}