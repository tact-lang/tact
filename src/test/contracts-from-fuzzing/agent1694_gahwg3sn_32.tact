struct HasString {
    str: String;
}

struct HasNested {
    nested: HasString;
}

contract TestDefaults {
    value: HasNested;

    init() {
        self.value = HasNested{ nested: HasString{ str: "abc" } };
    }
}