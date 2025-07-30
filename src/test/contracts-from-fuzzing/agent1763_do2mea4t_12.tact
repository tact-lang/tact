struct Top {
    a: Int;
    b: String;
    c: Bool;
    d: Cell;
    e: Address;
    f: Int?;
    g: String?;
    h: Bool?;
    i: Cell?;
    j: Address?;
}

contract MixedStructFields {
    val: Top;

    init() {
        self.val = Top{
            a:1,
            b:"hi",
            c:true,
            d:emptyCell(),
            e:myAddress(),
            f:null,
            g:null,
            h:null,
            i:null,
            j:null
        };
    }
}