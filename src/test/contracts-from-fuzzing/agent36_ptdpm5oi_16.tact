struct Defaults {
    meaning: Int = 42;
    name: String = "test";
    flag: Bool = true;
}

struct Chain {
    info: Defaults?;   // optional nested struct with defaults
    counter: Int = 0;
}

contract OptionalDefaults {
    field: Chain;

    init() {
        self.field = Chain{
            info: Defaults{ meaning: 88, name: "hi", flag: false },
            counter: 123
        };
    }

    receive() {
        let _ = self.field;
    }
}