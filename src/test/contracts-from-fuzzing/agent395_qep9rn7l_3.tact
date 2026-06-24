struct OptionalPrimitives {
    aa: Int?;
    bb: Bool?;
    cc: String?;
    dd: Cell?;
}

contract OptionalPrimitiveFields {
    data: OptionalPrimitives;

    init() {
        self.data = OptionalPrimitives{
            aa: 100,
            bb: null,
            cc: "ok",
            dd: null
        };
    }
}
