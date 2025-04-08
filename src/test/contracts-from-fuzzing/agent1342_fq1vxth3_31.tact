struct OnlyOptionals {
    x: Int?;
    y: Bool?;
    s: String?;
}

contract AllNullable {
    f: OnlyOptionals;

    init() {
        self.f = OnlyOptionals{
            x: null,
            y: null,
            s: null
        };
    }
}