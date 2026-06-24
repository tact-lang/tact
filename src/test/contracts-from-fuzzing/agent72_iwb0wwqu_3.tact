struct Inner {
    a: Int;
}

struct Outer {
    nested: Inner;
}

contract DeeplyNested {
    val: Outer;
    
    init() {
        self.val = Outer{ nested: Inner{ a: 5 } };
    }
}