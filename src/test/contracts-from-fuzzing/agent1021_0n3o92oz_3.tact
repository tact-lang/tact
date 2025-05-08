struct InnerStruct {
    number: Int = 1;
    flag: Bool = true;
    text: String = "hello";
}

contract MultiTypeNested {
    data: InnerStruct;

    init() {
        self.data = InnerStruct{};
    }
}