struct OptionalPrimitives {
    i: Int?;
    b: Bool?;
    s: String?;
}

contract OptPrimStore {
    store: OptionalPrimitives;

    init() {
        self.store = OptionalPrimitives{
            i: null,
            b: true,
            s: null,
        };
    }
}