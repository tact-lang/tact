struct Config {
    flag: Bool = true;
    amount: Int = 42;
}

contract Test {
    receive() {
        let c: Config = Config{};
    }
}