struct DeepInner {
    foo: Int;
    bar: Bool;
    baz: String;
}

struct Middle {
    num: Int;
    inn: DeepInner;
}

struct Outer {
    m: Middle;
    s: String;
    flag: Bool;
}

contract StorageTest {
    state: Outer;

    init() {
        self.state = Outer{
            m: Middle{
                num: 42,
                inn: DeepInner{
                    foo: 7,
                    bar: false,
                    baz: "ok",
                },
            },
            s: "hello",
            flag: true,
        };
    }
}