struct OptWithDefaults {
    a: Int? = 1;
    b: String? = "s";
}

contract OptDefaultsTest {
    o: OptWithDefaults;

    init() {
        self.o = OptWithDefaults{};
    }
}