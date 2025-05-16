struct MultiOptional {
    a: Int?;
    b: Bool?;
    c: Slice?;
    d: Address?;
}

contract MultiOptTest {
    data: MultiOptional;

    init() {
        self.data = MultiOptional{
            a: null,
            b: null,
            c: null,
            d: null
        };
    }
}
