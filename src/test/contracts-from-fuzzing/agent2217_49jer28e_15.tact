struct Mid {
    m1: Int;
    m2: Int;
    m3: Int;
}

struct Outer {
    x: Mid;
    y: Mid;
}

contract RepeatStructs {
    d: Outer;

    init() {
        self.d = Outer{
            x: Mid{ m1:1, m2:2, m3:3 },
            y: Mid{ m1:4, m2:5, m3:6 }
        };
    }
}
