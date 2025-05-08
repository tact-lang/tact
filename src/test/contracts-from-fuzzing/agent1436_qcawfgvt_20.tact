struct NestedOptionals {
    a: Int?;
    b: Bool?;
    c: Inner?;
}

struct Inner {
    x: String?;
    y: Slice?;
}

contract TestContract {
    data: NestedOptionals;

    init() {
        self.data = NestedOptionals{
            a: null,
            b: null,
            c: Inner{
                x: null,
                y: null,
            },
        };
    }
}
