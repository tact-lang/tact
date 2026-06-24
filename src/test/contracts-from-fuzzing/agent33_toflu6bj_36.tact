struct Config {
    mode: Int = 0;
    name: String = "def";
}

contract TestContract {
    optCfg: Config?;

    init() {
        self.optCfg = Config{ mode:1, name:"ovr" };
    }
}