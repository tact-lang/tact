struct DeeplyOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: NestedOptional?;
}

struct NestedOptional {
    x: Int?;
    y: Bool?;
}

contract DeepOptionTest {
    data: DeeplyOptional;

    init() {
        self.data = DeeplyOptional{
            a: null,
            b: null,
            c: null,
            d: NestedOptional{
                x: null,
                y: null,
            }
        };
    }
}