struct InnerRem {
    suffix: Slice as remaining;
}

struct OuterRem {
    inner: InnerRem; 
    foo: Int;
}

contract InvalidRemLayout {
    s: OuterRem;

    init() {
        self.s = OuterRem{ inner: InnerRem{ suffix: emptyCell().asSlice() }, foo: 123 };
    }
}
