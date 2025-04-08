struct ComplexOne {
    int1: Int; bool1: Bool; str1: String; cell1: Cell; slice1: Slice; addr1: Address;
    intOpt: Int?; boolOpt: Bool?; strOpt: String?; cellOpt: Cell?; sliceOpt: Slice?; addrOpt: Address?;
}

contract LargeComplex {
    f: ComplexOne;

    init() {
        self.f = ComplexOne{
            int1:1, bool1:true, str1:"hi", cell1:emptyCell(), slice1:emptyCell().asSlice(), addr1:myAddress(),
            intOpt:null, boolOpt:false, strOpt:null, cellOpt:null, sliceOpt:null, addrOpt:null
        };
    }
}