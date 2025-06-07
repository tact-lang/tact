struct Wide {
    f01: Int;
    f02: Bool;
    f03: String;
    f04: Address;
    f05: Cell;
    f06: Slice;
    f07: Int?;
    f08: Bool?;
    f09: String?;
    f10: Address?;
    f11: Cell?;
    f12: Slice?;
}

contract WideFields {
    val: Wide;
    
    init() {
        self.val = Wide{
            f01: 7, f02: true, f03: "hi", f04: myAddress(), f05: emptyCell(), f06: emptyCell().asSlice(),
            f07: null, f08: null, f09: null, f10: null, f11: null, f12: null
        };
    }
}
