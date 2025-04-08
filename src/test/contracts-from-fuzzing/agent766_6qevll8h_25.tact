// contract fields all initialized with default values and optionals
contract DefaultsTest {
    x: Int = 1;
    y: Int?;
    z: String? = null;
    q: Bool = false;

    init() {
        self.y = null;
    }
}