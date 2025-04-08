struct OptDefaults {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract OptDefaultsTest {
    opt: OptDefaults = OptDefaults{
        a: null,
        b: null,
        c: null,
        d: null
    };
}