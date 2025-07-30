struct MultiBasic {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
}

contract MultiTypes {
    data: MultiBasic;

    init() {
        self.data = MultiBasic{
            i: 1,
            b: true,
            s: "str",
            c: emptyCell(),
            sl: emptyCell().asSlice()
        };
    }
}