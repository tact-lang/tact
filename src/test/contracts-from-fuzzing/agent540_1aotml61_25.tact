struct DeepOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
}

struct NestedOptions {
    inner: DeepOptionals?;
    flag: Bool?;
}

contract LargeOptionalNest {
    optData: NestedOptions;

    init() {
        self.optData = NestedOptions{
            inner: null,
            flag: null
        };
    }
}