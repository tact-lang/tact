struct Complex {
    num: Int = 10;
    flag: Bool = false;
    text: String = "abc";
    opt: Int?;
    nested: Nested;
}

struct Nested {
    yes: Bool = true;
    comment: String?;
}

contract TestContract {
    optData: Complex? = null;

    init() {
        self.optData = Complex{
            num: 42,
            flag: true,
            text: "hello",
            opt: 55,
            nested: Nested{
                yes: false,
                comment: "hi",
            },
        };
    }
}
