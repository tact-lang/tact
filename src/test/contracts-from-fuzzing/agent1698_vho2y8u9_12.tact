struct Combo {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Address;
}

contract MixedFields {
    combos: Combo;

    init() {
        self.combos = Combo{
            a:1, b:true, c:"s", d:myAddress(),
            e:emptyCell(), f:emptyCell().asSlice(),
            g:null, h:null, i:null, j:myAddress()
        };
    }
}