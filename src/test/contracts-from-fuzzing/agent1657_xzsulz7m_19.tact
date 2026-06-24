struct Mix {
    num: Int;
    opt: Int?;
    flag: Bool;
    addr: Address;
    txt: String;
    sl: Slice;
    cl: Cell;
}

contract TestContract {
    mixed: Mix;
    init() {
        self.mixed = Mix{
            num: 7,
            opt: null,
            flag: true,
            addr: myAddress(),
            txt: "text",
            sl: emptyCell().asSlice(),
            cl: emptyCell()
        };
    }
}