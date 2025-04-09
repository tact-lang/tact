struct Config {
    a: Int = 1;
    b: Bool = true;
    c: Int = 3;
    d: Bool = false;
}

contract PartialInit {
    conf: Config;

    init() {
        self.conf = Config{ b: false };
    }
}