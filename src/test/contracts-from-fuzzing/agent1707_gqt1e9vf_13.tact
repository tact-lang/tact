struct HasString {
    s: String;
}

struct StringWrapper {
    inner: HasString;
}

contract StringsInStructs {
    val: StringWrapper;

    init() {
        self.val = StringWrapper{ inner: HasString{ s: "test string" } };
    }
}