struct Config {
    ver: String = "v1.0";
    author: String = "Alice";
    info: String = "none";
}

contract TestContract {
    cfg: Config;

    init() {
        self.cfg = Config{};
    }
}
