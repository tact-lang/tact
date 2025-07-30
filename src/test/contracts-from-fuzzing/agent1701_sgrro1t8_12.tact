struct WithDefaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "hi";
    d: Int?; // null default
    e: Bool?; // null default
}

contract DefaultVals {
    val: WithDefaults;

    init() {
        self.val = WithDefaults{
            d: null,
            e: null
        };
    }
}