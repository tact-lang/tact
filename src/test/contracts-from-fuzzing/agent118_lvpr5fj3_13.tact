struct ManyOptionalDefaults {
    a: Int?;
    b: Int? = null;
    c: Bool?;
    d: Bool? = null;
    e: Address?;
    f: Address? = null;
}

contract OptionDefaultTest {
    data: ManyOptionalDefaults;

    init() {
        self.data = ManyOptionalDefaults{
            a: null,
            c: null,
            e: null
        };
    }
}