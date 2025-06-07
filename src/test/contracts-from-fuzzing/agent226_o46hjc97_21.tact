struct VeryNestedInner {
    a: Int;
    b: Bool?;
}

struct VeryNestedOuter1 {
    inner: VeryNestedInner;
}

struct VeryNestedOuter2 {
    inner: VeryNestedOuter1;
}

struct VeryNestedOuter3 {
    inner: VeryNestedOuter2;
}

contract TestVeryNested {
    s: VeryNestedOuter3;

    init() {
        self.s = VeryNestedOuter3{
            inner: VeryNestedOuter2{
                inner: VeryNestedOuter1{
                    inner: VeryNestedInner{ a: 42, b: null }
                }
            }
        };
    }
}
