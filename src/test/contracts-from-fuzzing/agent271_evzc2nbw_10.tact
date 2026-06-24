struct LongList {
    f1: Int; f2: Bool; f3: Address; f4: String; f5: Slice;
    f6: Cell; f7: Builder; f8: Int?; f9: Bool?; f10: String?;
}

contract LongStructFieldTest {
    data: LongList;

    init() {
        self.data = LongList{
            f1:1, f2:true, f3:myAddress(), f4:"s", f5:emptyCell().asSlice(),
            f6:emptyCell(), f7:beginCell(), f8:null, f9:null, f10:null
        };
    }
}
