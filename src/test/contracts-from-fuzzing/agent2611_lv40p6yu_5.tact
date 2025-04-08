struct OptionalStruct {
    one: Int?;
    two: Bool?;
    three: String?;
    four: Address?;
}

contract OptionalsTest {
    opt: OptionalStruct;

    init() {
        self.opt = OptionalStruct{
            one: null,
            two: null,
            three: null,
            four: null
        };
    }
}