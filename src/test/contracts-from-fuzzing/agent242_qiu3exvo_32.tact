struct Inner {
    x: Int;
    y: Bool = true;
}

struct Outer {
    p: Int = 1;
    q: Bool;
    inr: Inner;
}

contract MixedInit {
    data: Outer;
    init() {
        self.data = Outer{
            p: 42,
            q: false,
            inr: Inner{ x: 7 }
        };
    }
}