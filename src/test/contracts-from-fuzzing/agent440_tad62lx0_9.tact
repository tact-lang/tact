struct MultiOptional {
    a: Int?;
    b: Bool?;
    c: Int?;
    d: Bool?;
    e: Int?;
    f: Bool?;
}

contract TestContract {
    data: MultiOptional;
    init() {
        self.data = MultiOptional{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}