struct OptionalSerialize {
    a: Int as uint16;
    b: Int?;
    c: Int? as int8;
}

contract OptSerializeTest {
    val: OptionalSerialize;

    init() {
        self.val = OptionalSerialize{
            a: 65000,
            b: null,
            c: 120
        };
    }
}
