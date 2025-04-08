struct Inner {
    x: Int;
    y: Bool;
    txt: String = "ok";
    maybeAddr: Address?;
}

contract TestNested {
    info: Inner = Inner{
        x: 1,
        y: true,
        txt: "done",
        maybeAddr: null,
    };

    init() {
        self.info = Inner{
            x: 42,
            y: false,
            txt: "hello",
            maybeAddr: null,
        };
    }
}