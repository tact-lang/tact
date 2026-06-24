struct NestedLarge {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
    g: Int?;
    h: Bool?;
    i: Address?;
    j: Cell?;
    k: Slice?;
    l: String?;
}

contract BigNestedContract {
    field: NestedLarge;

    init() {
        self.field = NestedLarge{
            a:1, b:true, c:myAddress(), d:emptyCell(), e:emptyCell().asSlice(), f:"",
            g:null, h:null, i:null, j:null, k:null, l:null
        };
    }
}