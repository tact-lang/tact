struct Combo {
    x: Int?;
    y: Bool;
    z: Bool?;
    s: String;
    sopt: String?;
    addr: Address;
    slc: Slice;
    cel: Cell;
    builder: Builder;
}

contract ComboTest {
    f: Combo;

    init() {
        self.f = Combo {
            x:null,y:true,z:null,s:"hi",sopt:null,
            addr: myAddress(),
            slc: emptyCell().asSlice(),
            cel: emptyCell(),
            builder: beginCell()
        };
    }
}