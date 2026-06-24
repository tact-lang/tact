struct BooleanOnly {
    one: Bool;
    two: Bool;
    three: Bool;
    four: Bool;
}

contract BoolStorage {
    flags: BooleanOnly;

    init() {
        self.flags = BooleanOnly{
            one: true, two: false, three: false, four: true
        };
    }
}
