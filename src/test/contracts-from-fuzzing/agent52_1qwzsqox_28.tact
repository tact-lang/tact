struct DiffTypes {
    num: Int;
    txt: String;
    flg: Bool;
    opt: Int?;
    adrs: Address;
    sl: Slice;
    cl: Cell;
}

contract TestContract {
    mixed: DiffTypes;

    init() {
        self.mixed = DiffTypes{
            num:42,
            txt:"string",
            flg:true,
            opt:null,
            adrs:myAddress(),
            sl:emptyCell().asSlice(),
            cl:emptyCell()
        };
    }
}
