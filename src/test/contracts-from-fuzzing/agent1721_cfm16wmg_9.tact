struct Defaults {
    a: Int = 10;
    b: Bool = false;
    c: String = "hello";
}

contract DefaultsContract {
    data: Defaults;

    init() {
        self.data = Defaults{};
    }
}