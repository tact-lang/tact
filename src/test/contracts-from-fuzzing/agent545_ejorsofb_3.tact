struct OptionStruct {
    x: Int?;
    y: Bool?;
    z: Address?;
}

contract OptionalFieldTest {
    info: OptionStruct;

    init() {
        self.info = OptionStruct{
            x: null,
            y: true,
            z: null
        };
    }
}
