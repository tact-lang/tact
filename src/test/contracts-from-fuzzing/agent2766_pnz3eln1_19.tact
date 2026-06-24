struct Inner1 {
    f1: Int;
    f2: Int;
}

struct Inner2 {
    b1: Bool;
    b2: Bool;
}

struct NestedMix {
    part1: Inner1;
    part2: Inner2;
    text: String;
}

contract ContractNestedMix {
    val: NestedMix;

    init() {
        self.val = NestedMix{
            part1: Inner1{f1: 3, f2: 4},
            part2: Inner2{b1: true, b2: false},
            text: "ok",
        };
    }
}