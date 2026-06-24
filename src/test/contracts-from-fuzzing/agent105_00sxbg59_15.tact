struct WrapString {
    s: String;
}

struct WrapOpt {
    inner: WrapString?;
}

contract OptStructWrap {
    opt: WrapOpt;

    init() {
        self.opt = WrapOpt{
            inner: null,
        };
    }
}