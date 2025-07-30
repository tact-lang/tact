struct DefaultsTest {
    a: Int = 5;
    b: Bool = true;
    c: Int?;  
    d: Bool?;
}

contract TestContract {
    dt: DefaultsTest;

    init() {
        self.dt = DefaultsTest{};
    }
}