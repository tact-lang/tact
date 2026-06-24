struct ManyFields {
    a: Int;
    b: Bool;
    c: Int?;
    d: Cell;
    e: Address;
    f: String;
    g: Bool?;
    h: Slice;
    i: Int;
}

contract TestContract {
    data: ManyFields;
    init() {
        self.data = ManyFields{
            a:1, b:true, c:null, d: emptyCell(), e: myAddress(), f:"hi", g:null, h: emptyCell().asSlice(), i:42
        };
    }
}