// nested struct with multiple nested optional primitives
struct Inner {
    ai: Int?;
    bs: String?;
    ci: Int?;
    db: Bool?;
}

struct Outer {
    inner: Inner;
    flag: Bool;
}

contract NestedMultiOpt {
    field: Outer;

    init() {
        self.field = Outer{
            inner: Inner{
                ai: null, bs: null, ci: null, db: null
            },
            flag: true
        };
    }
}
