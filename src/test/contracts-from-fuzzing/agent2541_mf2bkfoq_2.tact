struct DeepStruct {
    s1: Int;
    s2: Bool;
    s3: String;
    s4: Cell;
    s5: Slice;
    s6: Address;
    s7: Int?;
    s8: Bool?;
    s9: String?;
    s10: Cell?;
    s11: Slice?;
    s12: Address?;
}

contract TestContract {
    deep: DeepStruct;

    init() {
        self.deep = DeepStruct{
            s1: 1, s2: true, s3: "", s4: emptyCell(), s5: emptyCell().asSlice(), s6: myAddress(),
            s7: null, s8: null, s9: null, s10: null, s11: null, s12: null
        };
    }
}