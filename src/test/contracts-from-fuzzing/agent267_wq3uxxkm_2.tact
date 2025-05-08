struct Inner {
    flag: Bool;
    note: String?;
}

contract NestExample {
    info: Inner;

    init() {
        self.info = Inner{
            flag: true,
            note: "hello",
        };
    }
}