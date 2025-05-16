struct InnerMost { a: Int; }
struct InnerOptional { inner: InnerMost?; }
struct Middle { left: InnerOptional; right: InnerOptional; }

contract OptionalNestedStruct {
    big: Middle;

    init() {
        self.big = Middle{
            left: InnerOptional{ inner: null },
            right: InnerOptional{ inner: null },
        };
    }
}