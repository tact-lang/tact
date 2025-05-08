struct Nested {
    foo: Int;
    bar: Bool?;
}

struct Container {
    inner: Nested?;
    flag: Bool;
    num: Int;
}

contract Storage {
    state: Container = Container{
        inner: null,
        flag: false,
        num: 0,
    };

    init() {
        self.state = Container{
            inner: Nested{ foo: 17, bar: null },
            flag: true,
            num: 12,
        };
    }
}
