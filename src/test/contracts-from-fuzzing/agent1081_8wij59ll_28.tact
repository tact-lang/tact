struct BigCombo {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int;
    h: Bool;
    i: String;
}

contract Combo {
    val: BigCombo;

    init() {
        self.val = BigCombo{
            a:1, b:true, c:"x", d:null, e:null, f:null, g:7, h:false, i:"end"
        };
    }
}