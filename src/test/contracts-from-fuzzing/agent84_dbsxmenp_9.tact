struct WithDefaults {
    x: Int = 1;
    y: Int?;
    z: String = "hello";
}

contract StructDefaultsTest {
    data: WithDefaults;
    init() {
        self.data = WithDefaults{
            y: null,
        };
    }
}
