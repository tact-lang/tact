struct Sub {
    v: Int;
    f: Bool;
    s: String;
}

struct SubOpt {
    s: Sub?;
    n: Int;
}

contract WrapOpt {
    val: SubOpt;
    init() {
        self.val = SubOpt{
            s: null,
            n: 123
        };
    }
}