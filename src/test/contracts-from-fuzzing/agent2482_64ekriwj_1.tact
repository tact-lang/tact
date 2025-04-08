struct Inner {
    z: Int;
}

struct Outer {
    x: Int;
    y: Inner;
}

contract TestContract {
    data: Outer;
    
    init() {
        self.data = Outer{
            x: 1,
            y: Inner{ z:2 },
        };
    }
}