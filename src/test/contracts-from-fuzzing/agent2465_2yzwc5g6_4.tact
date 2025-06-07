struct Inner {
    x: Int;
    y: Int?;
    z: Bool;
}

struct Outer {
    one: Inner;
    two: Inner;
    three: Inner;
}

contract TestContract {
    snapshot: Outer;
    
    init() {
        self.snapshot = Outer{
            one: Inner{ x: 1, y: null, z: false },
            two: Inner{ x: 2, y: 3, z: true },
            three: Inner{ x: 4, y: null, z: true }
        };
    }
}