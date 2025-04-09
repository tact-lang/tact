struct HasDefaults {
    a: Int = 10;
    b: Bool = false;
    c: String = "def";
    d: Int?; // defaults to null implicitly
    e: Bool?; // defaults to null implicitly
}

contract DefaultsContract {
    data: HasDefaults;

    init() {
        self.data = HasDefaults{};
    }
}