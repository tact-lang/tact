struct InnerStruct {
    f: Int;
    g: Bool;
    h: String;
}

contract OptionalStructField {
    s: InnerStruct?;

    init() {
        self.s = null;
    }
}