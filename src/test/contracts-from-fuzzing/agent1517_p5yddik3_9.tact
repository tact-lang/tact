struct Config {
    val: Int = 5;
    enable: Bool = false;
    flagOpt: Bool?; // default null implied
}

contract Test {
    cfg: Config;

    init() {
        self.cfg = Config { val: 42 };
    }

    receive() {}
}