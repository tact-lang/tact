struct Crazy {
    intopt: Int?;
    boolopt: Bool?;
    strconv: String?;
    addr: Address;
    cell: Cell;
    slc: Slice;
    s3: String;
    
}

contract TestContract {
    c1: Crazy;
    c2: Crazy?;

    init() {
        self.c1 = Crazy{
            intopt: null, boolopt: null, strconv: null,
            addr: myAddress(), cell: emptyCell(), slc: emptyCell().asSlice(), s3: "abc"
        };
        self.c2 = null;
    }
}