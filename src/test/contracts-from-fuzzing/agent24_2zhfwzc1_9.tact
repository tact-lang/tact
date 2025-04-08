struct DefaultValuesTestStruct {
    num: Int = 100;
    isReady: Bool = true;
    text: String = "abc";
}

contract DefaultValuesTest {
    data: DefaultValuesTestStruct;

    init() {
        self.data = DefaultValuesTestStruct{};
    }
}