struct Combo {
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

contract ComboContract {
    x: Combo;

    init() {
        self.x = Combo{
            a:1, b:true, c:"c", d:null, e:false, f:null, g:2, h:true, i:"i"
        };
    }
}