// Slightly nested structure combining optionals, default values, primitives
struct Config {
    enabled: Bool = true;
    comment: String?;
}

struct Status {
    code: Int;
    config: Config;
}

contract OptionalDefaultMix {
    current: Status;

    init() {
        self.current = Status{
            code: 7,
            config: Config{
                enabled: false,
                comment: null,
            },
        };
    }
}
