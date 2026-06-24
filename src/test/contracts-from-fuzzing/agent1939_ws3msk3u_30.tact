struct HasAll {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    addr: Address;
}

contract AllIn {
    data: HasAll;
    init() {
        self.data = HasAll{
            i:1, b:true, s:"x", c:emptyCell(), sl:emptyCell().asSlice(), addr:myAddress()
        };
    }
}