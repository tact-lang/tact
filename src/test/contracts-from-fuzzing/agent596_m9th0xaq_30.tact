struct MixTypes {
    intv: Int;
    boolv: Bool;
    optsv: Int?;
    addr: Address;
    cel: Cell;
    sli: Slice;
    build: Builder;
    str: String;
    optstr: String?;
}

contract AllTypesPersisted {
    v: MixTypes;

    init() {
        self.v = MixTypes{
            intv: 10,
            boolv: true,
            optsv: null,
            addr: myAddress(),
            cel: emptyCell(),
            sli: emptyCell().asSlice(),
            build: beginCell(),
            str: "abc",
            optstr: null
        };
    }
}