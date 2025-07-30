struct Sub {
    flag: Bool;
}

struct WithDefaults {
    a: Int = 1;
    b: String = "hello";
    c: Bool?;
    d: Sub;
}

contract DefaultsInStructTest {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{
            d: Sub{flag: true},
        };
    }
}