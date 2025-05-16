struct Msg1 {
   f1: Int;
}

struct Msg2 {
   f2: Bool;
}

contract Test25 {
    s1: Msg1;
    s2: Msg2;

    init() {
        self.s1 = Msg1{ f1: 1 };
        self.s2 = Msg2{ f2: true };
    }
}