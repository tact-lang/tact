struct Settings {
    threshold: Int = 100;
    enabled: Bool = true;
    note: String?;
}

contract Test {
    config: Settings;

    init() {
        self.config = Settings{};
    }
}