struct DefaultStruct {
    x: Int = 5;
    y: Bool = true;
    s: String = "default";
}

contract DefaultValuesTest {
    my: DefaultStruct;

    init() {
        self.my = DefaultStruct{};
    }
}