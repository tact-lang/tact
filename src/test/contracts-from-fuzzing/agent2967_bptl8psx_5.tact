struct DefaultValStruct {
    x: Int = 7;
    y: Bool = true;
}

contract DefaultsTest {
    val: DefaultValStruct;

    init() {
        self.val = DefaultValStruct{};
    }
}