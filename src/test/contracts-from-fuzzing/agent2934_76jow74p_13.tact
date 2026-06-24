struct Complex {
    flag: Bool;
    num: Int;
    txt: String?;
}

contract ManyOptionals {
    c1: Complex?;
    c2: Complex?;
    c3: Complex?;

    init() {
        self.c1 = null;
        self.c2 = Complex{flag: true, num: 5, txt: "hey"};
        self.c3 = null;
    }
}