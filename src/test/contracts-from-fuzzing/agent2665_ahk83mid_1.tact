struct MultiTypes {
    n: Int;
    flag: Bool;
    addr: Address;
    txt: String;
    sl: Slice;
    cl: Cell;
}

contract FullVarTest {
    mt: MultiTypes;

    init() {
        self.mt = MultiTypes{
            n: 1,
            flag: true,
            addr: myAddress(),
            txt: "abc",
            sl: emptyCell().asSlice(),
            cl: emptyCell(),
        };
    }
}