struct ZeroDefaults {
    x: Int = 0;
    y: Bool = false;
    s: String = "";
}

contract LeaveDefaults {
    rec: ZeroDefaults;

    init() {
        self.rec = ZeroDefaults{};
    }
}