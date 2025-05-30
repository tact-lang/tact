struct Huge {
    a: Int; b: Int; c: Int; d: Int;
    e: Bool; f: Bool; g: Bool; h: Bool;
    i: String; j: String; k: String; l: String;
    m: Int?; n: Bool?; o: String?;
    p: Int; q: Bool; r: String;
    s: Int?; t: Bool?; u: String?;
}

contract MegaStorage {
    data: Huge;

    init() {
        self.data = Huge{
            a:1, b:2, c:3, d:4,
            e:true, f:false, g:true, h:false,
            i:"i", j:"j", k:"k", l:"l",
            m:null, n:true, o:"o",
            p:5, q:false, r:"r",
            s:null, t:null, u:null,
        };
    }
}
