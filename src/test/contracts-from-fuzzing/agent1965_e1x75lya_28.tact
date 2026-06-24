struct Sub {
    a: Int;
}

struct Middle {
    s: Sub;
}

contract AssignInit {
    mid: Middle;

    init() {
        self.mid = Middle{ s: Sub{ a:123 }};
    }
}