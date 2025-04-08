struct BigFields {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: Cell;
    f5: Slice;
    f6: String;
    f7: Bool;
    f8: Int;
    f9: Bool;
}

contract BigStructStorage {
    data: BigFields;
    
    init() {
        self.data = BigFields {
            f1: 1,
            f2: true,
            f3: myAddress(),
            f4: emptyCell(),
            f5: emptyCell().asSlice(),
            f6: "hi there",
            f7: false,
            f8: 42,
            f9: true
        };
    }
    
    receive() {
        let _ = self.data.f1;
    }
}