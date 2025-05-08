struct DeepConfig {
    name: String?;
    age: Int?;
    flag: Bool?;
}

contract TestContract {
    foo: Int;
    cfg: DeepConfig;
    bar: Bool;

    init() {
        self.foo = 5;
        self.cfg = DeepConfig{ name: null, age: null, flag: true };
        self.bar = false;
    }

    receive() {
        self.foo;
        self.cfg;
        self.bar;
    }
}