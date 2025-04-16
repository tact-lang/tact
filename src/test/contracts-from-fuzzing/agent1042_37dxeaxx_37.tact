struct LargeCombi {
    i1: Int;
    i2: Int;
    i3: Int;
    b1: Bool;
    b2: Bool;
    b3: Bool;
    s1: String;
    s2: String;
    c1: Cell;
    c2: Cell;
    addr1: Address;
    addr2: Address;
    slice1: Slice;
    slice2: Slice;
}

contract ManyTypes {
    d: LargeCombi;
    init() {
        self.d = LargeCombi{
            i1:1, i2:2, i3:3,
            b1:true, b2:false, b3:true,
            s1:"one", s2:"two",
            c1:emptyCell(), c2:emptyCell(),
            addr1:myAddress(), addr2:myAddress(),
            slice1:emptyCell().asSlice(), slice2:emptyCell().asSlice()
        };
    }
}