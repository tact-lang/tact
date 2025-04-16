struct Defaulted {
    field1: Int = 0;
    field2: String = "zero";
    field3: Bool = false;
    field4: Int?; // implicitly null
}

contract DefaultsTest {
    data: Defaulted;

    init() {
        self.data = Defaulted{};
    }
}
