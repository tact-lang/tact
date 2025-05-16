struct Inner {
    x: Int;
    opt: Bool?;
}

struct Outer {
    inner: Inner;
    num: Int;
}

contract TestContract {
    outer: Outer;
    
    init() {
        self.outer = Outer{ inner: Inner{ x: 42, opt: null }, num: 100 };
    }
}