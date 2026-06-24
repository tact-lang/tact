struct Mixed {
    number: Int;
    flag: Bool;
    text: String;
}

contract ArrayLike {
    a: Mixed;
    b: Mixed;
    c: Mixed;
    d: Mixed;

    init() {
        self.a = Mixed{number: 1, flag: true, text: "A"};
        self.b = Mixed{number: 2, flag: false, text: "B"};
        self.c = Mixed{number: 3, flag: true, text: "C"};
        self.d = Mixed{number: 4, flag: false, text: "D"};
    }
}