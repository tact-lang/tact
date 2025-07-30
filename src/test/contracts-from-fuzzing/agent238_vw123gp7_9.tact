struct ManyTypes {
    foo: Int;
    bar: Bool;
    text: String;
    dat: Cell;
    addr: Address;
    sl: Slice;
    bl: Builder;
}

contract VarietyStore {
    data: ManyTypes;

    init() {
        self.data = ManyTypes{
            foo:1, bar:true, text:"hi", dat:emptyCell(), addr:myAddress(), sl:emptyCell().asSlice(), bl:beginCell()
        };
    }
}