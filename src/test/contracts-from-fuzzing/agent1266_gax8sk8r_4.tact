struct Config {
    name: String = "anon";
    value: Int;
}

contract MixedDefaults {
    conf: Config;

    init() {
        self.conf = Config{
            name: "set_in_init",
            value: 99
        };
    }
}