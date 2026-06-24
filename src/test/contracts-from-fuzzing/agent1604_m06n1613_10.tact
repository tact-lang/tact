struct OptionStruct {
    one: Int?;
    two: Bool?;
    three: String?;
}

struct NestedOuter {
    plain: Int;
    nested: OptionStruct;
}

contract LotsOfOptional {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            plain: 55,
            nested: OptionStruct{
                one: 22,
                two: null,
                three: "hello"
            }
        };
    }

    receive() {}
}