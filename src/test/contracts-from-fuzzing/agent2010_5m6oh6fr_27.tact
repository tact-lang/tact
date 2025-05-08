struct Base {
    x: Int;
    y: String;
}

struct WrapOpt {
    inner: Base?;
    note: String;
}

contract OptionStructField {
    w: WrapOpt;

    init() {
        self.w = WrapOpt{
            inner: Base{ x:1, y:"ok" },
            note: "done",
        };
    }
}