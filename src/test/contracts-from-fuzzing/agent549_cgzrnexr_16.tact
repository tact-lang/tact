struct OptionalDuo {
    f1: Int?;
    f2: Bool?;
}

struct OptionalOuter {
    inner: OptionalDuo;
    flag: Bool;
    num: Int;
}

contract OptNested {
    field: OptionalOuter;

    init() {
        self.field = OptionalOuter{
            inner: OptionalDuo{ f1: null, f2: null },
            flag: true,
            num: 42,
        };
    }

    receive() {
        self.field = OptionalOuter{
            inner: OptionalDuo{ f1: 100, f2: false },
            flag: false,
            num: -42,
        };
    }
}