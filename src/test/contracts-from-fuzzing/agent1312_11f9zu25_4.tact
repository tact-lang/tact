struct S1 {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
}

contract ManyTypes {
    state: S1;
    
    init() {
        self.state = S1{
            a: 1,
            b: false,
            c: "hi",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress()
        };
    }
}