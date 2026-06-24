struct Large {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: Bool?;
    f6: String?;
    f7: Cell;
    f8: Slice;
    f9: Address;
}

contract LargeFields {
    state: Large;

    init() {
        self.state = Large{
            f1:1, f2:true, f3:"a", f4:null, f5:false, f6:null,
            f7: emptyCell(), f8: emptyCell().asSlice(), f9: myAddress()
        };
    }
}