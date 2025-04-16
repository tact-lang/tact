struct Defaults {
    i: Int = 0;
    b: Bool = false;
    s: String = "";
}

contract DefStructInit {
    data: Defaults;
    init() {
        self.data = Defaults{};
    }
}