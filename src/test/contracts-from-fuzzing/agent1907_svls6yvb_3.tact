struct InnerMost {
    val: Int;
    flag: Bool;
}

struct Inner {
    nested: InnerMost;
    num: Int;
}

struct Outer {
    inner: Inner;
    text: String;
}

contract DeepNestedStruct {
    payload: Outer;

    init() {
        self.payload = Outer{
            inner: Inner{
                nested: InnerMost{ val: 42, flag: false },
                num: 99
            },
            text: "hello"
        };
    }
}