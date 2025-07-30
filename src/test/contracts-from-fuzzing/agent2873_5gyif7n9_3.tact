struct S1 {
    i1: Int;
    b1: Bool;
    s1: String;
    c1: Cell;
    sl1: Slice;
    addr1: Address;
}

contract ManyTypesContract {
    data: S1;
    
    init() {
        self.data = S1{
            i1: 10,
            b1: true,
            s1: "str",
            c1: emptyCell(),
            sl1: emptyCell().asSlice(),
            addr1: myAddress()
        };
    }
}