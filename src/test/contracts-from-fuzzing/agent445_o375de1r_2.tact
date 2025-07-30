struct OptionalContainer {
    flag: Bool?;
    count: Int?;
    label: String?;
}

contract WithOptionalNested {
    data: OptionalContainer;

    init() {
        self.data = OptionalContainer{
            flag: null,
            count: 100,
            label: null
        };
    }
}
