struct Combo {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
}

contract AllTypes {
    val: Combo;

    init() {
        self.val = Combo{
            a:1, b:null, c:true, d:null, e:"x", f:null
        };
    }
}