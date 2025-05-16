struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    p: Inner;
    z: Int;
}

contract NestedStructTest {
    data: Outer;
    
    init() {
        self.data = Outer{p: Inner{x: 1, y: true}, z: 5};
    }
}