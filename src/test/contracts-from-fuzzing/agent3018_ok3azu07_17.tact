struct LargeOptional {
    f1: Int?;
    f2: String?;
    f3: Bool?;
    f4: Address?;
    f5: Cell?;
    f6: Slice?;
}

contract BigOptTest {
    data: LargeOptional = LargeOptional{
        f1: null,
        f2: null,
        f3: null,
        f4: null,
        f5: null,
        f6: null,
    };
}
