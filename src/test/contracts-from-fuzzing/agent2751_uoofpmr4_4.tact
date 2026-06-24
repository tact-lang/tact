struct OptionalStruct {
    x: Int?;
    y: Bool?;
}

contract OptionalStructFieldTest {
    opt: OptionalStruct;

    init() {
        self.opt = OptionalStruct{
            x: null,
            y: null,
        };
    }
}