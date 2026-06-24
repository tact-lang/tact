struct NestedOpts {
    a: Int?;
    b: Int?;
    c: Int?;
}

contract TestContract {
    data: NestedOpts;

    init() {
        self.data = NestedOpts{
            a: null,
            b: 1,
            c: null
        };
    }
}