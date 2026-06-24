struct PreInitStruct {
    foo: Int = 10;
    bar: Bool = false;
    text: String = "default";
}

contract DefaultStructField {
    data: PreInitStruct;

    init() {
        self.data = PreInitStruct{};
    }
}