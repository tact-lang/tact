struct NullableInner {
    a: Int?;
    s: String?;
}

contract OptionalInside {
    ni: NullableInner;

    init() {
        self.ni = NullableInner{
            a: null,
            s: null
        };
    }
}
