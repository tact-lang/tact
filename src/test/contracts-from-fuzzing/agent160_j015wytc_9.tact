struct NestedStrings {
    inner: InnerString;
}

struct InnerString {
    name: String;
    desc: String?;
}

contract NestedStr {
    data: NestedStrings;
    init() {
        self.data = NestedStrings{
            inner: InnerString{
                name: "Name",
                desc: null
            }
        };
    }
}