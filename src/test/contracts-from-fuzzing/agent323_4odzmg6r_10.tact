struct Config {
    ver: Int;
    flag: Bool;
}

contract Test {
    opts: Config?;

    init() {
        self.opts = null;
    }
}