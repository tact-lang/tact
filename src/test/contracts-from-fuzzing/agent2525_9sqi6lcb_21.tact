// Test empty init struct expression with all-defaults struct

struct AllDefaults {
    a: Int = 1;
    b: Bool = false;
    s: String = "ok";
}

contract TestContract {
    ad: AllDefaults;

    init() {
        self.ad = AllDefaults{};
    }
}