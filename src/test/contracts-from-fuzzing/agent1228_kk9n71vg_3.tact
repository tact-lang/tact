struct Sub {
    v: String?;
}

struct S {
    n: Int;
    sub: Sub?;
}

contract C {
    item: S;

    init() {
        self.item = S{
            n: 1,
            sub: Sub{
                v: null
            }
        };
    }
}