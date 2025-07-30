struct Bottom {
    q: Int;
}

struct MidOptional {
    k: Int?;
    sub: Bottom?;
}

struct Top {
    a: MidOptional?;
}

contract TestContract {
    field: Top;

    init() {
        self.field = Top{
            a: MidOptional{
                k:null,
                sub: Bottom{q:111},
            },
        };
    }
}
