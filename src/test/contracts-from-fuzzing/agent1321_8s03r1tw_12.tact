struct MyStruct {
    x: Int;
    y: Int?;
}

contract OptionalStructVar {
    field: MyStruct?;
    init() {
        self.field = MyStruct{ x: 1, y: null };
    }
}