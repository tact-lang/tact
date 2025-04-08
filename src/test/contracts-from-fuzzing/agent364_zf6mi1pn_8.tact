struct RecStruct {
    inner: Int;
    optStr: String?;
}

contract OptionalNested {
    rec: RecStruct?;

    init() {
        self.rec = null;
    }
}