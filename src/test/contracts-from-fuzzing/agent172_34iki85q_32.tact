struct MyStruct {
    field: Int;
}

contract OptionalStructField {
    data: MyStruct?;

    init() {
        self.data = null;
    }
}