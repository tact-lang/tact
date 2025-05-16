struct BigStruct {
    f1: Int;
    f2: String;
    f3: Int?;
    f4: String?;
    f5: Bool;
    f6: Bool?;
    f7: Address;
    f8: Cell;
    f9: Slice;
    f10: Int;
    f11: String;
}

contract JumboState {
    payload: BigStruct;

    init() {
        self.payload = BigStruct{
            f1: 1, f2: "2", f3: null, f4: null, f5: true,
            f6: null, f7: myAddress(), f8: emptyCell(), f9: emptyCell().asSlice(),
            f10: 10, f11: "eleven"
        };
    }
}