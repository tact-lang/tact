struct HasOptional {
    s: String?;
    b: Bool?;
    i: Int?;
}

contract TestContract {
    data: HasOptional;

    init() {
        self.data = HasOptional{
            s: null,
            b: true,
            i: 42,
        };
    }
}