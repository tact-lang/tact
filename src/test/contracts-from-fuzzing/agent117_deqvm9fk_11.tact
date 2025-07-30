struct RecA {
    val: Int;
}

struct RecB {
    a: RecA;
    opt: Bool?;
}

struct RecC {
    b: RecB;
    str: String;
}

contract Combo {
    c: RecC;

    init() {
        self.c = RecC{
            b: RecB{
                a: RecA{val: 77},
                opt: null
            },
            str: "combo"
        };
    }
}
