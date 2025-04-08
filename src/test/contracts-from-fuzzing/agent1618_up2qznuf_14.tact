struct InnerData {
    x: Int?;
    y: Bool;
}

contract OptionalStructWithOptionalFields {
    bigOpt: InnerData?;

    init() {
        self.bigOpt = null;
    }
}