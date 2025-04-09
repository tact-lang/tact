struct Nested {
    value: Int?;
    flag: Bool;
}

contract OptionalNested {
    data: Nested?;

    init() {
        self.data = Nested{value: null, flag: true};
    }
}