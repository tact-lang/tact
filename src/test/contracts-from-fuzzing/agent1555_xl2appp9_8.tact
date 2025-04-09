struct NestedString {
    innerStr: String;
}

struct WrapString {
    nested: NestedString;
    flag: Bool;
}

contract NestedStringStorage {
    info: WrapString;

    init() {
        self.info = WrapString{
            nested: NestedString{ innerStr:"data" },
            flag: false
        };
    }
}
