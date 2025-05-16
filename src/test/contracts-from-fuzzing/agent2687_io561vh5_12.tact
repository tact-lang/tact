struct DefaultValueStruct {
    a: Int = 10;
    b: Bool = true;
    c: String = "hello";
}

contract DefaultStructField {
    val: DefaultValueStruct;

    init() {
        self.val = DefaultValueStruct{};
    }
}