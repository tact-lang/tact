struct Settings {
    mode: Int = 1;
    desc: String = "none";
    flag: Bool = false;
}

contract TestContract {
    cfg: Settings;

    init() {
        self.cfg = Settings{
            mode: 2
            // leave desc and flag default
        };
    }
}