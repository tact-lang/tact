struct SNested1 {
    a: Int?;
    b: Bool;
}

struct SNested2 {
    s1: SNested1;
    c: String?;
}

contract NestedOptionals2 {
    val: SNested2;

    init() {
        self.val = SNested2{
            s1: SNested1{a: null, b: false},
            c: null
        };
    }
}