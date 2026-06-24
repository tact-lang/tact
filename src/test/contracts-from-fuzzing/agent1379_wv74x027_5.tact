struct OptInStruct {
    x: Int?;
    y: String?;
    b: Bool?;
}

contract OptStructTest {
    data: OptInStruct;

    init() {
        self.data = OptInStruct{
            x: null,
            y: null,
            b: null,
        };
    }
}
