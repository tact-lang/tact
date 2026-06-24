struct HasDefaults {
    a: Int = 1;
    b: String = "default";
    c: Bool?;
}

contract DefaultsTest {
    data: HasDefaults;

    init() {
        self.data = HasDefaults{
            c: null
        };
    }
}