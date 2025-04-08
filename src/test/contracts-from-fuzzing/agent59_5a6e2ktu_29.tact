struct Bunch {
    a: Int as int64;
    b: Bool;
    c: String;
    d: Bool?;
    e: Int?;
    f: String?;
}

contract BunchTest {
    v: Bunch;

    init() {
        self.v = Bunch{ a:1, b:true, c:"X", d:null, e:null, f:null };
    }
}