struct TinyDefaults {
    q: Bool = false;
    w: Int = 0;
    e: String = "";
    r: Bool? = null;
    t: Int? = null;
    y: String? = null;
}

contract DefContract {
    t: TinyDefaults;
    init() {
        self.t = TinyDefaults{};
    }
}