struct DefaultedStruct {
    a: Int = 7;
    b: Bool = true;
    c: String = "default";
}

contract DefaultsTest {
    data: DefaultedStruct;

    init() {
        self.data = DefaultedStruct {};
    }
}