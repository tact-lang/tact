struct HasDefaults2 {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract TestContract {
    hd2: HasDefaults2;

    init() {
        self.hd2 = HasDefaults2{};
    }
}