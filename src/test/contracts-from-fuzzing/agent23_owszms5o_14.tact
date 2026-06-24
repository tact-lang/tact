struct Inner {
    a: Int;
    b: Int?;    
}

struct Outer {
    x: Inner;  // no default
    y: Inner?; // optional
}

contract PartialNestedDefaults {
    d: Outer = Outer{
        x: Inner { a: 1, b: null },
        y: null
    };

    init() {
        self.d = Outer{
            x: Inner{ a: 7, b: null },
            y: Inner{ a: 3, b: 4 }
        };
    }
}