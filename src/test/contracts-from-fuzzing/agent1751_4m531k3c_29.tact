struct D {
    n: Int;
    s: String;
}

contract UseConst {
    const DEF: D = D{ n: 7, s: "s" };

    data: D;

    init() {
        self.data = self.DEF;
    }

    receive() {}
}