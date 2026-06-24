struct NestedOptDefaults {
    a: Int?;
    b: Bool?;
    c: String = "hello";
}

contract NestedOptionalsWithDefaults {
    val: NestedOptDefaults;

    init() {
        self.val = NestedOptDefaults{
            a: null,
            b: null
        };
    }
}