struct Bundle {
    a: Int;
    b: Bool;
    c: String;
}

contract TestContract {
    n: Int;
    bndl: Bundle;
    flag: Bool;
    txt: String;

    init() {
        self.n = 99;
        self.bndl = Bundle{ a: 1, b: true, c: "hey" };
        self.flag = false;
        self.txt = "ok";
    }
}