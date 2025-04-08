struct Nest1 {
    foo: Int;
    bar: String;
}

struct Nest2 {
    baz: Bool;
    qux: String?;
}

struct Combo {
    n1: Nest1;
    n2: Nest2;
    text: String;
    val: Int;
}

contract WideStructTest {
    comboField: Combo;

    init() {
        self.comboField = Combo{
            n1: Nest1{ foo: 42, bar: "hey" },
            n2: Nest2{ baz: true, qux: null },
            text: "hello",
            val: 77
        };
    }
}