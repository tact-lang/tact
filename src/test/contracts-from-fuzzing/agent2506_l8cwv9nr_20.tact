struct InnerStr {
    s: String;
}

struct ContainStr {
    val: Int;
    nested: InnerStr;
}

contract NestedStringStorage {
    data: ContainStr;
    init() {
        self.data = ContainStr {
            val: 345,
            nested: InnerStr {
                s: "foo",
            }
        };
    }
}
