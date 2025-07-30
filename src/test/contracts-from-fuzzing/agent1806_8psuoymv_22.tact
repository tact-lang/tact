struct OptionalDefault {
    a: Int?;
    b: Int = 5;
    c: Bool?;
    d: Bool = true;
}

contract OptionalDefaultStructTest {
    val: OptionalDefault;
    init() {
        self.val = OptionalDefault{
            a: null,
            c: null
        };
    }
}