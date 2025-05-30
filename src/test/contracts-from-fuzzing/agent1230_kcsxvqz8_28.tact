struct OptFieldDefaults {
    a: Int?;
    b: Int?;
}

contract OptStructEmptyInit {
    s: OptFieldDefaults;

    init() {
        self.s = OptFieldDefaults{};
    }
}