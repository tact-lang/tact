struct DeepOption {
    sub: InnerOption;
    val: String;
}

struct InnerOption {
    foo: Int?;
    bar: Bool?;
}

contract NestOpt {
    data: DeepOption;
    init() {
        self.data = DeepOption{
            sub: InnerOption{ foo: 7, bar: false },
            val: "xyz"
        };
    }
}