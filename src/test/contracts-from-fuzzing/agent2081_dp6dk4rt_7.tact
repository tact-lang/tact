struct OnlyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalStructField {
    s: OnlyOptionals;
    init() {
        self.s = OnlyOptionals{
            a: null,
            b: null,
            c: null
        };
    }
}