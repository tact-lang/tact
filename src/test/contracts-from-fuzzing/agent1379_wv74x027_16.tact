struct DeeplyOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract DeepOptionalsStorage {
    data: DeeplyOptional;

    init() {
        self.data = DeeplyOptional{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
        };
    }
}
