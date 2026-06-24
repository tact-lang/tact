struct Inner {
    a: Int;
    b: Int?;
}

struct Outer {
    inner: Inner;
    x: Int;
}

contract DeepNested {
    val: Outer;

    init() {
        self.val = Outer{
            inner: Inner{a: 10, b: null},
            x: 5
        };
    }
}