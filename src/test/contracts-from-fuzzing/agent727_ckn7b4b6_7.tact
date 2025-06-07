struct NestedOptional {
    a: Int?;
    b: Inner?;
}

struct Inner {
    c: String?;
    d: Bool;
}

contract TestContract {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            a: null,
            b: Inner{
                c: null,
                d: true
            }
        };
    }
}
