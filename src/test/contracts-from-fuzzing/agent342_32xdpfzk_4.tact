struct OptionStruct {
    x: Int?;
    y: Bool?;
    z: Address?;
    s: String?;
}

contract Test4 {
    maybe: OptionStruct;

    init() {
        self.maybe = OptionStruct{
            x: null,
            y: true,
            z: myAddress(),
            s: null,
        };
    }
}