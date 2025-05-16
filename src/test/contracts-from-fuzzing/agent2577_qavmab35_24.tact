struct Complicated {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Slice;
    f: Cell;
    g: Int?;
    h: String?;
    i: Address?;
    j: Slice?;
    k: Cell?;
}

contract MassiveStruct {
    item: Complicated;

    init() {
        self.item = Complicated{
            a:1, b:true, c:"x", d:myAddress(), e:emptyCell().asSlice(), f:emptyCell(),
            g:null, h:null, i:null, j:null, k:null
        };
    }
}
