struct Defaults {
    a: Int = 5;
    b: String = "dflt";
    c: Bool = true;
    d: Int?;
}

contract DefTest {
    val: Defaults;

    init() {
        self.val = Defaults{};
    }
}