struct DeepNest {
    inner1: Inner;
    inner2: Inner;
    name: String;
}

struct Inner {
    val: Int;
    optionalVal: Int?;
    label: String;
}

contract DeepNestedStorage {
    deep: DeepNest;

    init() {
        self.deep = DeepNest{
            inner1: Inner{ val: 1, optionalVal: null, label: "a" },
            inner2: Inner{ val: 2, optionalVal: null, label: "b" },
            name: "parent"
        };
    }
}