struct Huge {
    a: Int;
    b: Bool;
    c: String;
    d: Int;
    e: Bool;
    f: String;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Int;
    k: Bool;
    l: String;
}

contract StructHuge {
    s: Huge;
    init() {
        self.s = Huge{
            a:1, b:true, c:"c", d:4, e:false, f:"f",
            g:null, h:true, i:null, j:10, k:false, l:"last"
        };
    }
}