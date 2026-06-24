struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Bool?;
    e: Bool?;
    f: String?;
    g: String?;
    h: Address?;
    i: Address?;
    j: Cell?;
    k: Cell?;
}

contract ManyOptionalFields {
    stuff: ManyOptionals;

    init() {
        self.stuff = ManyOptionals{
            a:null, b:null, c:null,
            d:null, e:true, f:"x", g:null,
            h:null, i:myAddress(), j:emptyCell(), k:null
        };
    }

    receive() {}
}