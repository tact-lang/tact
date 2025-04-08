struct InnerOptionals {
    x: Int?;
    y: Bool?;
    z: String?;
}

struct OuterWrap {
    inner: InnerOptionals?;
}

contract OptionalStructOptionalField {
    s: OuterWrap;
    
    init() {
        self.s = OuterWrap{
            inner: null
        };
    }
}