struct InnerOptStruct {
    a: Int;
    b: Bool;
}

contract OptionalStructField {
    data: InnerOptStruct?;

    init() {
        self.data = null;
    }
}