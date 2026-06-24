message(0x1234) InnerMsg {
    x: Int;
    y: Bool;
}

struct Wrapper {
    im: InnerMsg?;
    name: String;
}

contract OptMsgInStructField {
    storage: Wrapper;

    init() {
        self.storage = Wrapper{
            im: null,
            name: "abc",
        };
    }
}