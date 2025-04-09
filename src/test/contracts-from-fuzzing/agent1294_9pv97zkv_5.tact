struct ManyOpts {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract OptFieldsTest {
    val: ManyOpts = ManyOpts{
        a: null,
        b: true,
        c: null,
        d: null
    };
    receive() {}
}