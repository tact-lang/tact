struct Inner {
    num: Int;
    flag: Bool;
}

struct Outer {
    embed: Inner;
    note: String;
}

contract DeepNestedStruct {
    storage: Outer;

    init() {
        self.storage = Outer{
            embed: Inner{num: 42, flag: false},
            note: "hi"
        };
    }
}
