struct Config {
    threshold: Int;
    active: Bool;
}

contract TestContract {
    opt1: Config?;
    opt2: Config?;

    init() {
        self.opt1 = null;
        self.opt2 = Config{
            threshold: 10,
            active: true,
        };
    }
}