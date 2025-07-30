// testing struct optional fields with defaults
struct Config {
    a: Int = 10;
    b: Bool?; // default null
    c: Int? = 5;
}

contract TestContract {
    conf: Config;

    init() {
        self.conf = Config{a:20, b:true, c:99};
    }
}