struct BigNest {
    inner1: Int;
    inner2: Bool;
    inner3: String;
    inner4: Cell;
    inner5: Slice;
    inner6: Address;
}

contract ManyTypes {
    field: BigNest;
    
    init() {
        self.field = BigNest{
            inner1: 5,
            inner2: false,
            inner3: "abc",
            inner4: emptyCell(),
            inner5: emptyCell().asSlice(),
            inner6: myAddress(),
        };
    }
}