struct HasString {
    s: String;
}

struct WrapOpt {
    f: HasString?;
}

contract OptStructWrap {
    v: WrapOpt;

    init() {
        self.v = WrapOpt{
            f: HasString{ s: "abc" }
        };
    }
}