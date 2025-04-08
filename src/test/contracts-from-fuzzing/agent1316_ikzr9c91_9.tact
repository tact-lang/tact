struct Stru {
    num: Int;
    flag: Bool;
    text: String;
}

contract MultiVars {
    a: Stru;
    b: Stru;
    c: Stru;

    init() {
        self.a = Stru{ num: 1, flag: true, text: "a" };
        self.b = Stru{ num: 2, flag: false, text: "b" };
        self.c = Stru{ num: 3, flag: true, text: "c" };
    }
}