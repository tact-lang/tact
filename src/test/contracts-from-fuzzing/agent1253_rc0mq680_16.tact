struct OptionalSerialize {
    a: Int? as int64;
    b: Bool?;
}

contract OptionalSerializeContract {
    val: OptionalSerialize;

    init() {
        self.val = OptionalSerialize{a: null, b: null};
    }
}
