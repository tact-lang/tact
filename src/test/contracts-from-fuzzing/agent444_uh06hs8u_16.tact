struct OptionalPrimitives {
    a: Int?;
    b: Bool?;
    s: String?;
    ad: Address?;
}

contract OptionalPrimitiveStruct {
    val: OptionalPrimitives;

    init() {
        self.val = OptionalPrimitives{
            a: null,
            b: true,
            s: null,
            ad: null,
        };
    }
}