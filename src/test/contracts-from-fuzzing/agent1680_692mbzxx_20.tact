struct Config {
    num: Int as uint4 = 5;
    big: Int as int257 = 123456;
    yes: Bool = true;
    label: String = "foo";
}

struct FullConfig {
    conf: Config = Config{ num:7, big:999999, yes:false, label:"bar" };
    enabled: Bool = true;
}

contract NestedSerial {
    s: FullConfig = FullConfig{};
    receive() {}
}