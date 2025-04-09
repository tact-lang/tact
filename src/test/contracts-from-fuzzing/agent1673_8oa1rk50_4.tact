struct OptInStruct {
    iv: Int;
    bv: Bool;
    sv: String;
}

contract OptionalStructField {
    data: OptInStruct?;

    init() {
        self.data = null;
    }
}