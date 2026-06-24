struct HasOptional {
    s: String?;
    b: Bool?;
    i: Int?;
}

contract OptStorage {
    data: HasOptional;
    init() {
        self.data = HasOptional{
            s: "hello",
            b: true,
            i: 42
        };
    }
}
