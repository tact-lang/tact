struct DeepNested {
    inner: NestedInner;
    flag: Bool;
}

struct NestedInner {
    num: Int;
    text: String;
}

contract DeepStorage {
    val: DeepNested;

    init() {
        self.val = DeepNested{
            inner: NestedInner{num: 42, text: "hi"},
            flag: false
        };
    }
}