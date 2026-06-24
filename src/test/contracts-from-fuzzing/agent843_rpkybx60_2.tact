struct DeepNested {
    inner: NestedStruct;
    flag: Bool;
}

struct NestedStruct {
    a: Int;
    b: Bool;
}

contract DeepStorage {
    val: DeepNested;

    init() {
        self.val = DeepNested{
            inner: NestedStruct{a: 10, b: false},
            flag: true
        };
    }
}
