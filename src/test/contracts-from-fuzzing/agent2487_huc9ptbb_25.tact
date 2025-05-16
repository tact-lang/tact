struct Combo {
    a: Int;
    b: Bool?;
    c: String;
    d: Bool;
    e: Int?;
    f: String?;
}

contract TestContract {
    c: Combo;

    init() {
        self.c = Combo{
            a:1, b:null, c:"c", d:true, e:null, f:null
        };
    }
}