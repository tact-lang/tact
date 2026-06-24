struct Defaults {
    a: Int = 5;
    b: Bool = false;
    c: String = "hi";
}

contract DefaultContract {
    field: Defaults;

    init() {
        self.field = Defaults{};
    }
}