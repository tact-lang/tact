struct OptAndDefaults {
    i1: Int? = null;
    i2: Int?;
    i3: Int? = 5;
}

contract OptDefaultsTest {
    data: OptAndDefaults;

    init() {
        self.data = OptAndDefaults{
            i2: null
        };
    }
}