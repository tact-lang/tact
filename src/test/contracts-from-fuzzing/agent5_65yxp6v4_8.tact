struct Defaults {
    d1: Int = 1;
    d2: Int = 2;
    d3: Int?;
}

contract DefaultsTest {
    field: Defaults;
    init() {
        self.field = Defaults{
            d1: 3,
            d2: 4,
            d3: null
        };
    }
}