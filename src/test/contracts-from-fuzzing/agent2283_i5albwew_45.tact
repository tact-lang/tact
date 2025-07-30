struct OptionalSerialize {
    a: Int?;
    b: Bool?;
}

contract OptionalSerializeContract {
    d: OptionalSerialize;

    init() {
        self.d = OptionalSerialize{
            a: null,
            b: null
        };
    }
}
