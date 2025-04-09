struct WithManyDefaults {
    a: Int = 1;
    b: String = "abc";
    c: Bool = false;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract DefaultStructContract {
    val: WithManyDefaults;
    init() {
        self.val = WithManyDefaults{
            d: null,
            e: null,
            f: null
        };
    }
}