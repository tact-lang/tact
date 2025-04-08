struct DeepOptionalNest {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
}

contract OptionalCluster {
    val: DeepOptionalNest;

    init() {
        self.val = DeepOptionalNest{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null
        };
    }
}
