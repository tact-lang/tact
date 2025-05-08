struct StringContainer {
    str: String;
}

contract NestedStringData {
    entry: StringContainer;

    init() {
        self.entry = StringContainer{ str: "hello" };
    }
}
