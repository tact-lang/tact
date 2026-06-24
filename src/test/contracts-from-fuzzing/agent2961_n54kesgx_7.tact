struct Large {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Address;
}

contract LargeStructContract {
    s: Large;
    init() {
        self.s = Large{
            a:1, b:true, c:myAddress(), d:emptyCell(), e:emptyCell().asSlice(),
            f:"hi", g:null, h:null, i:null, j:myAddress()
        };
    }
}