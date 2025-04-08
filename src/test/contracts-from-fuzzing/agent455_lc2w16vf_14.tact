struct DefaultValues {
    a: Int = 42;
    b: Bool = true;
    c: String = "hello";
    d: Int?;
    e: Bool?;
    f: String?;
}

contract StructDefaults {
    data: DefaultValues;

    init() {
        self.data = DefaultValues{
            d: null,
            e: false,
            f: "bye",
        };
    }
}