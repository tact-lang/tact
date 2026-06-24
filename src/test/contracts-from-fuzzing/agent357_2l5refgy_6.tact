struct WideMix {
    a: Int;
    b: Bool;
    c: Cell;
    d: Slice;
    e: Address;
    f: Bool?;
    g: String;
    h: Int?;
    i: String?;
    j: Cell?;
}

contract TestContract {
    mixed: WideMix;

    init() {
        self.mixed = WideMix{
            a:1, b:true, c: emptyCell(), d: emptyCell().asSlice(),
            e: myAddress(), f: null, g:"hello", h:null, i:null, j:null
        };
    }
}