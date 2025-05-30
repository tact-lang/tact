struct OnlyOptions {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestOptionals {
    field: OnlyOptions;

    init() {
        self.field = OnlyOptions{
            a: null,
            b: null,
            c: null,
        };
    }
}