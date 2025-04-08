struct ManyOptionals {
    a: Int?; b: Int?; c: Bool?; d: Bool?;
}

contract OptFields {
    f: ManyOptionals;

    init() {
        self.f = ManyOptionals{
            a: null, b: 42, c: null, d: true
        };
    }
}