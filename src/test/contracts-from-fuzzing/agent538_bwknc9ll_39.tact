struct StructOptInStruct {
    nested: Int?;
}

contract TopWithOptStruct {
    inner: StructOptInStruct?;

    init() {
        self.inner = null;
    }
}
