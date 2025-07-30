struct Combine {
    op1: Int?;
    op2: Bool?;
    s: String;
    i: Int;
}

contract Combos {
    c: Combine;

    init() {
        self.c = Combine{
            op1: null,
            op2: null,
            s: "abc",
            i:77
        };
    }
}