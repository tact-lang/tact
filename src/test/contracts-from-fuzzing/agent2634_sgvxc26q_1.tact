struct Nested {
    value: Int;
    opt_inner: Inner?;
}

struct Inner {
    x: Int;
    flag: Bool;
}

contract TestContract {
    data: Nested;

    init() {
        self.data = Nested{
            value: 1,
            opt_inner: Inner{
                x: 2,
                flag: true,
            },
        };
    }
}