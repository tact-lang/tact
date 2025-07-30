struct WithDefaults {
    x: Int = 7;
    y: Bool = false;
    z: Int?;
}

contract DefaultStructFieldTest {
    field: WithDefaults;

    init() {
        self.field = WithDefaults{z: null};
    }
}