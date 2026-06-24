struct Config {
    version: Int = 1;
    name: String = "default";
    flag: Bool = false;
    note: String? = null;
    count: Int? = null;
}

contract Test {
    settings: Config;

    init() {
        self.settings = Config{};
    }
}