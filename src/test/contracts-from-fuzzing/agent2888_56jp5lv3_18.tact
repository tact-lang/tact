// test struct with defaults
struct WithDefaults {
    a: Int = 1;
    b: String = "hello";
    c: Bool = false;
    d: Int?;
}

contract HasDefaults {
    val: WithDefaults;

    init() {
        self.val = WithDefaults{
            d: null,
        };
    }
}