struct Deep {
    flag: Bool;
    text: String;
    num: Int;
}

contract MidOpt2 {
    a: Int;
    b: Bool?;
    c: Deep?;
    d: String;

    init() {
        self.a = 1;
        self.b = null;
        self.c = null;
        self.d = "zzz";
    }
}