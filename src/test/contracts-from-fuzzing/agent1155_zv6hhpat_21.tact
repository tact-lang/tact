struct Nested {
    f: Int;
    s: String?;
}

struct MultiNest {
    a: Nested?;
    b: Nested?;
    c: Nested?;
    d: Nested?;
}

contract TestContract {
    total: MultiNest;

    init() {
        self.total = MultiNest{
            a: Nested{f:1,s:null},
            b: null,
            c: Nested{f:3,s:"hi"},
            d: null
        };
    }
}