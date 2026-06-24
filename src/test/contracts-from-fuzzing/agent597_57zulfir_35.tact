struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    x: Inner?;
    y: Int;
    z: Bool?;
}

contract OptMixedNested {
    val: Outer;
    init() {
        self.val = Outer{
            x: Inner{ a:99, b:false },
            y: 42,
            z: null
        };
    }
}