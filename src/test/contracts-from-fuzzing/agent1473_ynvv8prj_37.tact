struct Different {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    a: Address;
}

contract TestContract {
    diff: Different;

    init() {
        self.diff = Different{ i:2, b:false, s:"boo", c:emptyCell(), sl:emptyCell().asSlice(), a:myAddress() };
    }
}