// Struct with some default values
struct Defaults {
    x: Int = 5;
    y: Bool = true;
    z: String = "Hello";
}

contract WithDefaults {
    d: Defaults;
    init() {
        self.d = Defaults{};
    }
    receive() {
        self.d.x += 1;
    }
}