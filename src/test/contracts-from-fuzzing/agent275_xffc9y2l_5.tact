struct DefaultsStruct {
    a: Int = 5;
    b: Bool = false;
    c: String = "hi";
}

contract DefaultValues {
    data: DefaultsStruct;

    init() {
        self.data = DefaultsStruct{};
    }
}