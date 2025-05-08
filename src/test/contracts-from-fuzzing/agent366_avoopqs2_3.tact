struct Defaulted {
    a: Int = 0;
    b: Bool = false;
    c: String = "";
    d: Int?; // implicit null default
    e: Bool?; // implicit null default
}

contract DefaultsTest {
    val: Defaulted;
    init() {
        self.val = Defaulted{};
    }
}