struct Config { mustSet: Int; }

contract TestContract {
    cfg: Config?;

    init() {
        self.cfg = null;
    }
}