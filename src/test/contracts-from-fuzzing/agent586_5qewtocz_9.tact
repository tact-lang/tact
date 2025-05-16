struct Base {
    id: Int;
}

struct WithDefault {
    data: Int = 7;
    note: String = "abc";
}

struct Complex {
    inner: Base;
    optional: Int?;
    withDefaults: WithDefault;
    flag: Bool;
}

contract ComplexNestedContract {
    value: Complex;

    init() {
        self.value = Complex{
            inner: Base{ id: 1 },
            optional: null,
            withDefaults: WithDefault{},
            flag: true
        };
    }

    receive() {
        self.value = self.value;
    }
}