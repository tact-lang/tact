struct Config {
    flag: Bool? = null;
    limit: Int? = null;
    label: String? = null;
}

contract DefaultsNested {
    conf: Config;

    init() {
        self.conf = Config{};
    }
}