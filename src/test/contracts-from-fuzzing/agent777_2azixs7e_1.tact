struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    nested: Inner;
    x: Int;
}

contract TestContract {
    data: Outer;
    
    init() {
        self.data = Outer{
            nested: Inner{ a: 1, b: true },
            x: 42
        };
    }
}