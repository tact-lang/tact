struct Config {
    flag: Bool = false;
    greeting: String = "hello";
    number: Int = 1;
}

contract DefaultStruct {
    s: Config;

    init() {
        self.s = Config{};
    }
}