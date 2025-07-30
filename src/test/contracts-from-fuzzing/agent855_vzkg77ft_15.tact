struct Settings {
    threshold: Int?;
    mode: String?;
}

struct Status {
    active: Bool;
    settings: Settings?;
    lastLog: String?;
}

contract NestedComplex {
    st: Status;

    init() {
        self.st = Status{
            active: true,
            settings: Settings{
                threshold: null,
                mode: "fast",
            },
            lastLog: null,
        };
    }

    receive() {}
}