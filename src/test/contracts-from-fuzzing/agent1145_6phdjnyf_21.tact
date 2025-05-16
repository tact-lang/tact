struct DefaultOverrideStruct {
    a: Int = 1;
    b: Bool = false;
}

contract DefaultOverrideTest {
    data: DefaultOverrideStruct;
    init() {
        self.data = DefaultOverrideStruct{
            a: 42,
            b: true
        };
    }
}
