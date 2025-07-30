struct Inner {
    x: Int;
}

struct Outer {
    inner: Inner?;
}

contract OptNestedStruct {
    val: Outer;

    init() {
        self.val = Outer{
            inner: Inner{x: 99},
        };
    }
}
