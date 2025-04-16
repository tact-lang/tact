struct OptionalNested {
    value: Int?;
    flag: Bool?;
    note: String?;
}

contract TestContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            value: null,
            flag: true,
            note: "notes",
        };
    }

    receive() {}
}