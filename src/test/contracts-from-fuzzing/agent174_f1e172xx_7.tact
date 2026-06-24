struct DefaultsTest {
    x: Int = 5;
    y: Bool = true;
    z: Int?;
}

contract TestContract {
    store: DefaultsTest;

    init() {
        self.store = DefaultsTest{ z: null };
    }
}