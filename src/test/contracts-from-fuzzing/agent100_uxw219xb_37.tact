struct HasBoolIntString {
    b: Bool;
    i: Int;
    s: String;
}

contract WithStructs {
    data: HasBoolIntString;

    init() {
        self.data = HasBoolIntString{ b: true, i: 42, s: "test" };
    }
}