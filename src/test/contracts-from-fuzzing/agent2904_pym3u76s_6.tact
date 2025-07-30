struct InnerMost {
    finalVal: Int;
}

struct Inner {
    middleVal: String;
    innerMost: InnerMost;
}

contract NestedInContract {
    val: Int;
    flag: Bool;
    message: String;
    nested: Inner;

    init() {
        self.val = 42;
        self.flag = true;
        self.message = "hello";
        self.nested = Inner{
            middleVal: "mid",
            innerMost: InnerMost{
                finalVal: 123,
            },
        };
    }
}