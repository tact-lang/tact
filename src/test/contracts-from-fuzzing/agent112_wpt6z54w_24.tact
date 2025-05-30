struct OnlyOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalStructContract {
    data: OnlyOptional;

    init() {
        self.data = OnlyOptional{
            a: null,
            b: null,
            c: null
        };
    }
}