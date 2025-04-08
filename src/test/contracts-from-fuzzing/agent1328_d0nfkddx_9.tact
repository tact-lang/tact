struct An {
    a: Int?;
}

struct Bn {
    a: An?;
}

contract NestedOptionals {
    v: Bn;
    init() {
        self.v = Bn{ a: null };
    }
}