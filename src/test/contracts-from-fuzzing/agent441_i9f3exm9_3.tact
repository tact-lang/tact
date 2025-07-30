struct Inner {
    x: Int;
    y: Int;
}

struct Middle {
    point: Inner;
    description: String;
}

struct Outer {
    middle: Middle;
    valid: Bool;
}

contract TestContract {
    outerField: Outer;
    
    init() {
        self.outerField = Outer{
            middle: Middle{ point: Inner{ x: 1, y: 2 }, description: "desc" },
            valid: true
        };
    }
}
