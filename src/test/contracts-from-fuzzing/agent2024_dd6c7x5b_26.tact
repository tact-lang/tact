struct SOptionals {
    a: Int?;
    b: Bool?;
    s: String?;
}

contract OptionalsBundled {
    data: SOptionals;

    init() {
        self.data = SOptionals{
            a: null,
            b: null,
            s: null
        };
    }
}