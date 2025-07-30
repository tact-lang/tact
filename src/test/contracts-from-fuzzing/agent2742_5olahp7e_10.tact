struct DefaultStruct {
    field1: Int = 5;
    field2: Bool = true;
    field3: String = "default";
}

contract DefaultStructContract {
    data: DefaultStruct;

    init() {
        self.data = DefaultStruct{};
    }
}