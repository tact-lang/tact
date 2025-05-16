struct DeeplyOptional {
    a: Int?;
    b: String?;
    c: Int?;
    d: String?;
}

contract NestedOptContract {
    data: DeeplyOptional;

    init() {
        self.data = DeeplyOptional{
            a: null,
            b: null,
            c: null,
            d: null
        };
    }
}