struct OptsAndDefaults {
    x: Int = 100;
    y: Int?;
    z: Bool = false;
    s: String?;
}

contract OptDefTest {
    field: OptsAndDefaults;

    init() {
        self.field = OptsAndDefaults{
            y: null,
            s: "hello"
        };
    }
}