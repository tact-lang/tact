struct Config {
    enabled: Bool = true;
    version: Int = 0;
    note: String = "";
    optionalVal: Int?; // defaults to null
}

contract DefaultStruct {
    settings: Config;
    init() {
        self.settings = Config{};
    }
}