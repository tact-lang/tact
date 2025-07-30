struct Bottom {
    txt: String;
}

struct Mid {
    b: Bottom?;
    f: Bool;
}

struct Top {
    id: Int;
    payload: Mid;
    addr: Address;
}

contract Test {
    t: Top;

    init() {
        self.t = Top{
            id: 99,
            payload: Mid{
                b: Bottom{txt: "hello"},
                f: false,
            },
            addr: myAddress(),
        };
    }
}
