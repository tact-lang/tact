struct SOpt {
    inner: Int?;
}

contract NullableStruct {
    f: SOpt?;
    init() {
        self.f = null;
    }
}