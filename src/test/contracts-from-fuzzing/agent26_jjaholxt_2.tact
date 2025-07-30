struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    x: Inner;
    y: Int?;
    z: Bool;
}

contract TestNest {
    nested: Outer;
    
    init() {
        self.nested = Outer{
            x: Inner{a: 7, b: true},
            y: null,
            z: false
        };
    }
}