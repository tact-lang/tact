struct NestedS {
    foo: Int;
    bar: String;
}

contract DefaultsNested {
    val: NestedS = NestedS{ foo: 3, bar: "abc" };

    init() {
        self.val = NestedS{ foo: 4, bar: "def" };
    }
}