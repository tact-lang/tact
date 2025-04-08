struct DefaultValStruct {
    x: Int = 42;
    y: Bool = true;
}

contract DefaultValsTest {
    d: DefaultValStruct;
    init() {
        self.d = DefaultValStruct{};
    }
}