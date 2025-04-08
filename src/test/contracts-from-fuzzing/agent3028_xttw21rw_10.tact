struct SomeStruct {
    a: Int;
    b: Int;
    c: Int;
}

contract OptionalStructField {
    data: SomeStruct?;

    init() {
        self.data = null;
    }
}
