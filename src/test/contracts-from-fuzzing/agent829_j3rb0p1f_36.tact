struct HasOptions {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract DefaultOptions {
    field: HasOptions = HasOptions{
        a: null,
        b: null,
        c: null,
    };

    init() {
        self.field = HasOptions{
            a:123,
            b:true,
            c:"hi",
        };
    }
}