struct OptStruct {
    value: Int?;
    name: String?;
    data: Cell?;
    flag: Bool?;
    nested: Nested?;
}

struct Nested {
    text: String?;
    number: Int?;
}

contract OptionFields {
    state: OptStruct;

    init() {
        self.state = OptStruct{
            value: null,
            name: null,
            data: null,
            flag: null,
            nested: null,
        };
    }
}
