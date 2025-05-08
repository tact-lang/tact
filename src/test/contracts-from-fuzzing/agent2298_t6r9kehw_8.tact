struct Wide {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Cell;
    h: Cell?;
    i: Address;
    j: Address?;
}

contract WideTypes {
    w: Wide;

    init() {
        self.w = Wide{
            a:1, b:true, c:"text", d:null, e:null, f:null,
            g: emptyCell(), h: null, i: myAddress(), j: null,
        };
    }
}