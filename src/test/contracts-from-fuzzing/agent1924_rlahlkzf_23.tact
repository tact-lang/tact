struct WeirdOrder {
    f1: Bool;
    f2: Int as uint8;
    f3: String;
    f4: Slice;
    f5: Address;
    f6: Cell;
    f7: Bool?;
    f8: Int?;
    f9: String?;
    f10: Address?;

}

contract TestContract {
    data: WeirdOrder;

    init() {
        self.data = WeirdOrder{
            f1:true, f2:7, f3:"abc", f4:emptyCell().asSlice(), f5:myAddress(), f6:emptyCell(),
            f7:null, f8:null, f9:null, f10:null
        };
    }
}