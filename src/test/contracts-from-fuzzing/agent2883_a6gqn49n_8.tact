struct OptionalStruct {
    innerInt: Int?;
    innerBool: Bool?;
    innerStr: String?;
}

contract OptionalStructField {
    maybeStruct: OptionalStruct?;

    init() {
        self.maybeStruct = null;
    }
}