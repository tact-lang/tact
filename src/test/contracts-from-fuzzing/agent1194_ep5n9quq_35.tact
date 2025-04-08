struct OptionalSerialize {
    a: Int?;
    b: Bool?;
}

contract StructOptionalSerialize {
    val: OptionalSerialize;

    init() {
        self.val = OptionalSerialize{ a: null, b: null };
    }
}