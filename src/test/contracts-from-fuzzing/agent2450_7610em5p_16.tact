struct Combo {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Address;
    h: Address?;
    i: Slice;
    j: Slice?;
}

contract ComboStructStorage {
    data: Combo;

    init() {
        self.data = Combo{
            a:1, b:null, c:true, d:false, e:"e", f:null, g:myAddress(), h:null, i:emptyCell().asSlice(), j:null
        };
    }
}
