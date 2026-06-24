struct DeepOptional {
    inner: Int?;
    flag: Bool;
}

struct Parent {
    deep: DeepOptional?;
    text: String;
}

contract OptionOnStruct {
    s: Parent;

    init() {
        self.s = Parent{deep: null, text: "abc"};
    }
}