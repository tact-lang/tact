struct DefaultsStruct {
    foo: Int = 7;
    bar: String = "hello";
    flag: Bool = true;
}

contract DefaultStructField {
    val: DefaultsStruct;

    init() {
        self.val = DefaultsStruct{};
    }
}