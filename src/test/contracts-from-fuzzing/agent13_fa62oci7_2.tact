struct Nested {
    inner: Int;
    opt: Int?;
    str: String;
}

struct Composite {
    n: Nested;
    val: Int?;
    txt: String;
    flag: Bool;
}

contract CompositeFieldTest {
    data: Composite;

    init() {
        self.data = Composite{
            n: Nested{
                inner: 10,
                opt: null,
                str: "hello",
            },
            val: 42,
            txt: "hi",
            flag: true,
        };
    }
}