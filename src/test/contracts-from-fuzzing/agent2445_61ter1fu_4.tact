struct Large {
    a: Int;
    b: Bool;
    c: Int?;
    d: String;
    e: Bool?;
    f: String?;
    g: Int;
    h: Bool;
    i: String;
    j: Int?;
    k: String?;
    l: Bool;
    m: String;
    n: Int;
}

contract Test {
    st: Large;

    init() {
        self.st = Large{
            a:1, b:true, c:null, d:"d", e:false, f:"f",
            g:2, h:false, i:"i", j:10, k:null, l:true, m:"m", n:99
        };
    }

    receive() {}
}