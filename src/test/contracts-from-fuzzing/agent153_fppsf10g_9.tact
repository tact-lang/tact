struct OptionalsInside {
    text: String?;
    flag: Bool?;
}

struct ContainOptionals {
    nested: OptionalsInside;
    number: Int?;
}

contract NestedOptionalFields {
    state: ContainOptionals;

    init() {
        self.state = ContainOptionals{
            nested: OptionalsInside{
                text: null,
                flag: null
            },
            number: null
        };
    }

    receive() {
        self.state = ContainOptionals{
            nested: OptionalsInside{
                text: "x",
                flag: true
            },
            number: 55
        };
    }
}