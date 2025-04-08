struct OptionalInner {
    a: Int?;
    b: Bool?;
}

struct HasOptionalInner {
    inner: OptionalInner?;
    z: Int;
}

contract Test7 {
    hoi: HasOptionalInner;

    init() {
        self.hoi = HasOptionalInner{
            inner: null,
            z: 999,
        };
    }
}