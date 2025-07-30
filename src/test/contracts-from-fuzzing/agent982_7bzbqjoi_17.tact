struct SomeStruct {
    x: Int;
    y: Int;
}

contract OptionalStructField {
    optstruct: SomeStruct?;

    init() {
        self.optstruct = null;
    }
}