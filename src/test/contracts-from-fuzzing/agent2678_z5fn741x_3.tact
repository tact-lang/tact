struct DeepNested {
    num: Int;
    flag: Bool;
}

struct WrapNested {
    inner: DeepNested;
    msg: String;
}

contract TestDeep {
    deep: WrapNested;

    init() {
        self.deep = WrapNested{
            inner: DeepNested{
                num: 99,
                flag: false
            },
            msg: "deep!"
        };
    }
}