struct OptionalNested {
    field: Int?;
    flag: Bool;
}

contract OptionalStructStorage {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{ field: null, flag: false };
    }
}