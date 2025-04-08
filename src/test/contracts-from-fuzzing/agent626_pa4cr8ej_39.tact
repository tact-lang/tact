struct OptDeepWrap {
    c: Cell?;
    s: Slice?;
    b: Builder?;
}

contract OptionalInsideCells {
    d: OptDeepWrap;

    init() {
        self.d = OptDeepWrap{
            c: null,
            s: null,
            b: null
        };
    }
}