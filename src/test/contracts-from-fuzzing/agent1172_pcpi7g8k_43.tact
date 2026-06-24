struct Diverse {
    i: Int;
    b: Bool;
    s: String;
    addr: Address;
    cell: Cell;
    slice: Slice;
    builder: Builder;
    oi: Int?;
    ob: Bool?;
}

contract DiverseTest {
    val: Diverse;

    init() {
        self.val = Diverse{
            i:1,
            b:true,
            s:"x",
            addr: myAddress(),
            cell: emptyCell(),
            slice: beginCell().endCell().asSlice(),
            builder: beginCell(),
            oi: null,
            ob: null
        };
    }
}