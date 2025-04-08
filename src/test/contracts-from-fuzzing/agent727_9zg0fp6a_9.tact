struct Complex {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: Cell;
    f5: Builder;
    f6: Slice;
    f7: String;
    f8: Int?;
    f9: Bool?;
    f10: Address?;
    f11: Cell?;
    f12: Builder?;
    f13: Slice?;
    f14: String?;
}

contract ComplexContract {
    data: Complex;

    init() {
        self.data = Complex{
            f1:1,
            f2:true,
            f3:myAddress(),
            f4:emptyCell(),
            f5:beginCell(),
            f6:emptyCell().asSlice(),
            f7:"hi",
            f8:null,
            f9:null,
            f10:null,
            f11:null,
            f12:null,
            f13:null,
            f14:null
        };
    }
}