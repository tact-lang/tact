contract CombinedFields {
    i1: Int = 1;
    b1: Bool = true;
    s1: String = "hi";
    addr1: Address;
    slice1: Slice;
    optionalInt: Int?;
    optionalString: String?;
    optionalBool: Bool?;
    init() {
        self.addr1 = myAddress();
        self.slice1 = emptyCell().asSlice();
        self.optionalInt = null;
        self.optionalString = null;
        self.optionalBool = null;
    }
}