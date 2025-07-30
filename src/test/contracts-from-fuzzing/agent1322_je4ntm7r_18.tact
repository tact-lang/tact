struct InnerMost {
    f: Int;
}

struct Inner {
    x: InnerMost; 
}

struct Outer {
    y: Inner;
}

contract DeepFieldAccess {
    data: Outer;

    init() {
        self.data = Outer{ y: Inner{ x: InnerMost{ f: 123 } } };
    }
}