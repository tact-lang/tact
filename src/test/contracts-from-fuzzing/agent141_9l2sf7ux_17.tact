struct BigNestedOptionDefaults {
    a: Int = 0;
    b: Small?;
}

struct Small {
    c: Bool?;
    d: String = "x";
}

contract BigOptDefaultsTest {
    big: BigNestedOptionDefaults;

    init() {
        self.big = BigNestedOptionDefaults{};
    }
}