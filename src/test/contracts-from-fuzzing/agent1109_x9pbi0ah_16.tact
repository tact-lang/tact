struct DefaultOverrides {
    x: Int = 1;
    y: Bool = true;
}

contract OverrideTest {
    data: DefaultOverrides;

    init() {
        self.data = DefaultOverrides{
            x: 999,
            y: false
        };
    }
}