struct NestedOpt {
    a: Int?;
    b: Bool?;
    c: Inner?;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract TestContract {
    data: NestedOpt;

    init() {
        self.data = NestedOpt{
            a: null,
            b: true,
            c: Inner{
                x: 5,
                y: false,
            },
        };
    }
}
