struct Info {
    flag: Bool;
    note: String;
}

contract TestContract {
    n1: Int;
    optInfo: Info?;
    s: String;
    enabled: Bool;
    inf: Info;

    init() {
        self.n1 = 10;
        self.optInfo = null;
        self.s = "abc";
        self.enabled = true;
        self.inf = Info{flag: false, note: "xyz"};
    }
}