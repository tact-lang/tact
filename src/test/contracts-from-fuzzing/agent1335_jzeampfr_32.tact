struct InnerStruct {
    q: Int;
}

contract OptionalStructField {
    f: InnerStruct?;

    init() {
        self.f = null;
    }
}