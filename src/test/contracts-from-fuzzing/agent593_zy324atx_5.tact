struct Defaults {
    a: Int = 5;
    b: Bool = false;
    c: String = "def";
}

contract DefaultField {
    field: Defaults = Defaults{};
    init() {
        self.field = Defaults{};
    }
}