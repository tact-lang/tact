struct ManyFields {
    a: Int;
    b: Int;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Address;
    h: Address?;
    i: Cell;
    j: Cell?;
}

contract ManyFieldStruct {
    val: ManyFields;
    init() {
        self.val = ManyFields{
            a:1, b:2, c:true, d:null, e:"x", f:null, g: myAddress(), h: null, i: emptyCell(), j: null
        };
    }
}