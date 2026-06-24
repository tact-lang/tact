struct Config {
    threshold: Int;
}

contract TestContract {
    conf: Config? = null;

    init() {
        self.conf = Config{ threshold: 5 };
    }
}