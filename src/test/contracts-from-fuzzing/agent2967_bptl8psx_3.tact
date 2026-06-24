struct OptionNested {
    x: Int;
    y: Bool?;
    z: String?;
}

contract WithOptionalStruct {
    data: OptionNested;

    init() {
        self.data = OptionNested{
            x: 1,
            y: null,
            z: null,
        };
    }
}