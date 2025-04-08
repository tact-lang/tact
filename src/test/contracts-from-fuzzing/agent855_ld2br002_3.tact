struct Large {
    f1: Int; f2: Bool; f3: Address; f4: Int?; f5: Bool?; f6: String; f7: Cell; f8: Builder; f9: Slice; f10: String;
}

contract BigFieldsTest {
    s: Large;

    init() {
        self.s = Large{
            f1:1, f2:true, f3:myAddress(), f4:null, f5:false, f6:"hi", f7:emptyCell(), f8:beginCell(), f9:emptyCell().asSlice(), f10:"end"
        };
    }
}