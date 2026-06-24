struct S {
    a: Int;
}

struct Holder {
    s: S;
}

contract ExplicitNested {
    h: Holder;

    init() {
        self.h = Holder{ s:S{a:15} };
    }
}
