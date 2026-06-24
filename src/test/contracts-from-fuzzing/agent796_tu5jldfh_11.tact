// Test optional struct with defaults inside nested struct
struct Inner {
    a: Int = 5;
    b: Bool = false;
}

struct Outer {
    info: Inner?;
    n: Int;
}

contract TestContract {
    outerVal: Outer;
    init() {
        self.outerVal = Outer{
            info: null,
            n: 7
        };
    }
}