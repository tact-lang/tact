struct SerializeOptional {
    a: Int as uint8;
    b: Bool?;
    c: String?;
}

contract SerializeOptionals {
    q: SerializeOptional;

    init() {
        self.q = SerializeOptional{
            a: 7,
            b: null,
            c: "hey",
        };
    }
}