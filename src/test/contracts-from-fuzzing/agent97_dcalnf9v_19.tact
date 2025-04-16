struct SomeStruct { a: Int; b: Bool }
contract OptionalStructField {
    optVal: SomeStruct?;
    init() {
        self.optVal = null;
    }
}