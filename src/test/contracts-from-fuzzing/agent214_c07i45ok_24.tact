struct Config {
    enabled: Bool;
    threshold: Int;
    note: String?;
}

contract TestContract {
    cfg: Config?;

    init() {
        self.cfg = null;
    }
}