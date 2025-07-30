// optional struct with default value member
struct OptStructWithDefaults {
    a: Int?;
    b: Bool = true;
}

contract OptStructWithDefaultsTest {
    s: OptStructWithDefaults?;

    init() {
        self.s = null;
    }
}