struct Param {
    n: Int;
    flag: Bool;
    text: String;
    sl: Slice;
}

contract PersistParam {
    thing: Param;

    init() {
        self.thing = Param{
            n: 1,
            flag: true,
            text: "abc",
            sl: emptyCell().asSlice()
        };
    }
}
