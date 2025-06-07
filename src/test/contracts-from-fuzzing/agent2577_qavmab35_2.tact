struct DeepNested {
    level1: Inner;
    flag: Bool;
}

struct Inner {
    num: Int;
    text: String;
}

contract NestedContract {
    storage: DeepNested;

    init() {
        self.storage = DeepNested{
            level1: Inner{num: 123, text: "hello"},
            flag: true,
        };
    }
}
