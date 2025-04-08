struct Nested {
    inner: InnerOpt;
}

struct InnerOpt {
    optInt: Int?;
    optBool: Bool?;
}

contract TestContract {
    data: Nested;

    init() {
        self.data = Nested{
            inner: InnerOpt{
                optInt: 41,
                optBool: true,
            },
        };
    }
}