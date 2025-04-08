struct HasBoolIntString {
    flag: Bool;
    count: Int;
    text: String;
}

contract TestContract {
    item: HasBoolIntString;

    init() {
        self.item = HasBoolIntString{ flag: true, count: 42, text: "foo" };
    }
}
