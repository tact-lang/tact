struct DeepOptional {
    a: Int?;
    b: String?;
    c: Bool?;
    d: NestedOption?;
}

struct NestedOption {
    x: Int?;
    y: String?;
}

contract DeepOptionalContract {
    deep: DeepOptional;

    init() {
        self.deep = DeepOptional{
            a: null,
            b: null,
            c: null,
            d: null,
        };
    }
}