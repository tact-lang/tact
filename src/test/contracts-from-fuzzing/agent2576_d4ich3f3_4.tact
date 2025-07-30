struct OptionalStruct {
    name: String;
    age: Int?;
    flag: Bool?;
}

contract OptionalsTest {
    opts: OptionalStruct;

    init() {
        self.opts = OptionalStruct{
            name: "abc",
            age: null,
            flag: true
        };
    }
}