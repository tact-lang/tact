struct WithOptionals {
    name: String = "Default";
    number: Int?;
    flag: Bool?;
}

contract OptionalsNested {
    data: WithOptionals;

    init() {
        self.data = WithOptionals{
            number: 123,
            flag: true
        };
    }
}