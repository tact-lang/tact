struct NestedLevel3 {
    foo: Int;
    bar: String;
}

struct NestedLevel2 {
    inner: NestedLevel3;
    val: Int;
}

struct NestedLevel1 {
    deep: NestedLevel2;
    label: String;
}

contract DeepNestedStorage {
    record: NestedLevel1;

    init() {
        self.record = NestedLevel1 {
            deep: NestedLevel2 {
                inner: NestedLevel3 { foo: 42, bar: "deep" },
                val: 7
            },
            label: "ok"
        };
    }
}
