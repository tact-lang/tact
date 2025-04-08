struct OptionalInner {
    inner: InnerStruct?;
}

struct InnerStruct {
    f1: Int;
    f2: Bool;
}

contract OptionalStructField {
    ref: OptionalInner;
    init() {
        self.ref = OptionalInner{inner: null};
    }
}