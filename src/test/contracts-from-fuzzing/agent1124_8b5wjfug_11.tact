struct LargeOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Address?;
}

contract LargeOptionalTest {
    data: LargeOptional;

    init() {
        self.data = LargeOptional {
            a: null,
            b: true,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}