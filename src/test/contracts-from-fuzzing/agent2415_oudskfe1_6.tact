struct WithDefaults {
    a: Int = 0;
    b: Bool = true;
    c: String = "default";
    d: Int?;
}

contract DefaultTest {
    val: WithDefaults;

    init() {
        self.val = WithDefaults{
            d: null
        };
    }
}