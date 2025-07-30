struct Nested {
    inner: InnerOptionals;
}

struct InnerOptionals {
    num: Int = 777;
    flag: Bool?;
    text: String?;
}

contract TestContract {
    nested: Nested;

    init() {
        self.nested = Nested{
            inner: InnerOptionals{
                num: 42,
                flag: true,
                text: "hello"
            }
        };
    }
}