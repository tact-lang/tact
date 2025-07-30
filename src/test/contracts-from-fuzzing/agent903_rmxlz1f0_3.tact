struct OptNested {
    val: Int?;
    flag: Bool?;
}

contract OptionalFields {
    st: OptNested;

    init() {
        self.st = OptNested{ val: null, flag: true };
    }
}