struct NestedString {
    deep: InnerString;
}

struct InnerString {
    content: String;
}

contract NestedStringContract {
    storage: NestedString;

    init() {
        self.storage = NestedString{
            deep: InnerString{content: "hello world"}
        };
    }
}