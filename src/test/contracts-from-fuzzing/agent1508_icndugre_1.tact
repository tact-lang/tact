struct NestedOptionals {
    a: Int?;
    b: Bool?;
    c: Inner?;
}

struct Inner {
    d: String?;
    e: Bool;
}

contract TestContract {
    data: NestedOptionals;

    init() {
        self.data = NestedOptionals{
            a: null,
            b: true,
            c: Inner{
                d: null,
                e: false
            }
        };
    }
}
