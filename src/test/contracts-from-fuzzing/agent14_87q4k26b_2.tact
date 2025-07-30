struct Inner {
    flag: Bool;
}

struct Outer {
    innerOpt: Inner?;
    b: Int?;
    c: Bool?;
}

contract TestContract {
    field: Outer;
    init() {
        self.field = Outer{
            innerOpt: null,
            b: null,
            c: true
        };
    }
}