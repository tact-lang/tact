struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    inner: Inner;
    flag: Bool;
}

contract Test {
    data: Outer;
    
    init() {
        self.data = Outer{inner: Inner{a: 2, b: false}, flag: true};
    }
}