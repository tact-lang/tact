struct InnerLoooooong {
    aa: Int;
    ab: Bool;
    ac: String;
    ad: Cell;
    ae: Bool?;
    af: Int?;
    ag: Cell?;
    ah: String?;
    ai: Int;
}

contract LongFields {
    inner: InnerLoooooong;
    init() {
        self.inner = InnerLoooooong{
            aa: 1,
            ab: true,
            ac: "text",
            ad: emptyCell(),
            ae: null,
            af: null,
            ag: null,
            ah: null,
            ai: 42,
        };
    }
}