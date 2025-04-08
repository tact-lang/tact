struct Mixed {
    num: Int;
    flag: Bool;
    addr: Address;
    text: String;
    cl: Cell;
    sl: Slice;
}

contract TestContract {
    data: Mixed;

    init() {
        self.data = Mixed{
            num:1,
            flag:true,
            addr: myAddress(),
            text: "hello",
            cl: emptyCell(),
            sl: emptyCell().asSlice()
        };
    }
}