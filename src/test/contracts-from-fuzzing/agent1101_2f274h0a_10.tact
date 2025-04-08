struct BigNested {
    a: Int;
    b: Bool;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String;
    g: Int;
    h: Bool;
    i: String?;
    j: Int?;
}

contract NestedInContract {
    val: BigNested;
    
    init() {
        self.val = BigNested{
            a: 1, b: false, c: null, d: 4, e: true, f: "s",
            g: 7, h: true, i: "x", j: null
        };
    }
}