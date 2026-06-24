struct Defaulted { x: Int = 5; y: Bool = true; z: String = "hello"; }

contract DefaultsStructTest {
    data: Defaulted;

    init() {
        self.data = Defaulted{};
    }
}
