struct MyStruct {
    optional: Int?;
    str: String;
}

contract OptInStruct {
    field: MyStruct;

    init() {
        self.field = MyStruct{
            optional: null,
            str: "hello",
        };
    }
}