struct InnerOpt {
    val: Int;
}

struct Wrapper {
    text: String;
    inner: InnerOpt?;
}

contract OptionalNestedStruct {
    w: Wrapper = Wrapper{
        text: "init",
        inner: null
    };

    init() {
        self.w = Wrapper{
            text: "step",
            inner: InnerOpt{ val: 999 }
        };
    }

    receive() {}
}