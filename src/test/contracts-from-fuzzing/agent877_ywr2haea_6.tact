struct DefaultValTest {
    number: Int = 42;
    isSet: Bool = false;
    label: String = "test";
    optVal: Int?;  
}

contract DefaultsContract {
    info: DefaultValTest;

    init() {
        self.info = DefaultValTest{};
    }
}