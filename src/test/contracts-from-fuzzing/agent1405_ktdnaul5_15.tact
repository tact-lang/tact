struct InlineStruct { x: Int; y: Int }

contract OptionalStructField {
    optStruct: InlineStruct?;

    init() {
        self.optStruct = null;
    }
}