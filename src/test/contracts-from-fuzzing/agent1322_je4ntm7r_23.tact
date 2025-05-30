struct WithDefaultsAndOptionals {
    a: Int = 5;
    b: Int?;
    c: String = "hello";
    d: Bool?;
}

contract DefaultsOptionalsTest {
    data: WithDefaultsAndOptionals;

    init() {
        self.data = WithDefaultsAndOptionals{
            b: null,
            d: null
        };
    }
}