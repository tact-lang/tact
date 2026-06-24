struct WithDefaults {
    s: String = "default";
    n: Int as uint32 = 123;
    b: Bool = true;
    o: Int?; // implicitly null
}

contract DefaultsTest {
    rec: WithDefaults;

    init() {
        self.rec = WithDefaults{};
    }
}