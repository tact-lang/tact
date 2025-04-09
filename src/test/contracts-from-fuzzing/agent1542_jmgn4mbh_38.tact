struct Config {
    optA: Int?;
    optB: Bool?;
    optC: String?;
}

contract Test {
    cfg: Config;

    init() {
        self.cfg = Config{
            optA: 42,
            optB: true,
            optC: "foo"
        };
    }
}