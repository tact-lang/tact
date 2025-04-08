struct S1 {
    num: Int;
}

struct S2 {
    s1: S1;
    txt: String?;
}

contract OptionalsNested {
    data: S2;

    init() {
        self.data = S2{
            s1: S1{ num: 42 },
            txt: null
        };
    }
}
