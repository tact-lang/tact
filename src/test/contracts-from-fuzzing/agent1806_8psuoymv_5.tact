struct Defaults {
    d1: Int = 10;
    d2: Bool = true;
    d3: Address; // Without default
    d4: String = "default";
}

contract DefaultsTest {
    f: Defaults;
    init() {
        self.f = Defaults{
            d3: myAddress()
        };
    }
}