struct OptionalsInStruct {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptionalsInPersistent {
    s: OptionalsInStruct;

    init() {
        self.s = OptionalsInStruct{
            x: null,
            y: true,
            z: "hi"
        };
    }
}