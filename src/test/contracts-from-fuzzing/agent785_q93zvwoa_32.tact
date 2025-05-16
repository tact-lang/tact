struct Embed {
    boo: Bool;
    tx: String;
}

contract OptFirst {
    opt: Embed?;
    n: Int;

    init() {
        self.opt = null;
        self.n = 99;
    }
}