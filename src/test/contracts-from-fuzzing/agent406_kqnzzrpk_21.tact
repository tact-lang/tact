struct Mid {
    a: Int;
    b: Int;
    c: Int;
}

struct Outer {
    x: Mid;
    y: Mid;
}

contract TestContract {
    f: Outer;
    init() {
        self.f = Outer{
            x: Mid{ a:1,b:2,c:3 },
            y: Mid{ a:4,b:5,c:6 }
        };
    }
}