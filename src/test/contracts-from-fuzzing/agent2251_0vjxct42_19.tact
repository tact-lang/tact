struct NestedWithOptionals {
    inner1: Int;
    inner2: Bool?;
    inner3: Address;
    inner4: String?;
}

contract OptionalsInNested {
    field: NestedWithOptionals;

    init() {
        self.field = NestedWithOptionals{
            inner1: 42,
            inner2: null,
            inner3: myAddress(),
            inner4: null,
        };
    }
}