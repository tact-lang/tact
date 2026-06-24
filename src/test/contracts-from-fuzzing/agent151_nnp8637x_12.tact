message(1) M1 {
    x: Int;
    y: String?;
}

message(2) M2 {
    flag: Bool;
    text: String;
}

struct Combo {
    m1: M1;
    m2: M2?;
}

contract Test {
    c: Combo;

    init() {
        self.c = Combo{
            m1: M1{ x: 11, y: null },
            m2: null,
        };
    }
}