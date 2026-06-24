struct OptionalDeep {
    value: Int?;
    flag: Bool;
}

contract OptionalNested {
    data: OptionalDeep?;

    init() {
        self.data = null;
    }
}