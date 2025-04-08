struct MixedDefaults {
    a: Int = 10;
    b: Bool;
    c: String = "hi";
    d: Int?; // implicit null
}

contract PartialDefaultTest {
    data: MixedDefaults;

    init() {
        self.data = MixedDefaults{
            b: true
        };
    }
}