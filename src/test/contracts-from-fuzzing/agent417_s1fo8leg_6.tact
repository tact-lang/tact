struct Inner {
    a: Int;
}

struct Outer {
    b: Inner?;
    c: Inner?;
}

contract TestContract {
    state: Outer;
    
    init() {
        self.state = Outer{
            b: null,
            c: Inner{ a: 99 }
        };
    }
}