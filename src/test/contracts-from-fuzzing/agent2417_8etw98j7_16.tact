struct Mixed {
    i: Int;
    f: Bool?;
    s: String;
    c: Cell?;
    d: Int?;
}

contract MixedFields {
    m: Mixed;

    init() {
        self.m = Mixed{
            i:1,f:true,s:"hi",c:emptyCell(),d:null
        };
    }
}
