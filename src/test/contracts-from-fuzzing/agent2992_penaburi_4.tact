struct Combo {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Cell;
    f: Slice;
}

contract StructOptional {
    opt: Combo?;
    
    init() {
        self.opt = Combo{ a: 5, b: false, c: myAddress(), d: "hey", e: emptyCell(), f: emptyCell().asSlice() };
    }
}
