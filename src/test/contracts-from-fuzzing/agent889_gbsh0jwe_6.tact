struct NestedStructWithOptionalInner {
    inner: Inner?; 
}

struct Inner {
    x: Int;
    y: Int;
}

contract StoreNestedOptionalInner {
    nested: NestedStructWithOptionalInner;

    init() {
        self.nested = NestedStructWithOptionalInner{
            inner: null
        };
    }
}