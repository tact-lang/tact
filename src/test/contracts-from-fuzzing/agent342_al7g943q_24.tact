struct OptNestedMany {
    f1: Int?;
    f2: Int?;
    f3: Bool?;
    f4: String?;
    f5: Address?;
    f6: Cell?;
    f7: Slice?;
    f8: Builder?;
}

contract OptNestedContract {
    v: OptNestedMany;

    init() {
        self.v = OptNestedMany{
            f1:null, f2:null, f3:null, f4:null, f5:null, f6:null, f7:null, f8:null
        };
    }
}
