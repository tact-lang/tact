struct DefaultsStruct {
    num: Int = 5;
    flag: Bool = true;
    text: String = "hi";
    optionalVal: Int?; // defaults to null
}

contract DefaultsTest {
    stored: DefaultsStruct;

    init() {
        self.stored = DefaultsStruct{};
    }

    receive() {
        self.stored = DefaultsStruct{num: 11, flag: false, text: "hello", optionalVal: 42};
    }
}