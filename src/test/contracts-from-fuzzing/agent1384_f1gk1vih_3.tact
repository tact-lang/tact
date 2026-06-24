struct Inner {
    x: Int;
}

struct Middle {
    inner: Inner;
}

struct Outer {
    middle: Middle;
}

contract DeepNested {
    obj: Outer;
    
    init() {
        self.obj = Outer{ middle: Middle{ inner: Inner{ x: 77 } } };
    }
}