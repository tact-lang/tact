struct ManyOptionals {
    x: Int?;
    y: Int?;
    z: Int?;
    s: String?;
    t: String?;
    flag: Bool?;
}

contract EmbeddedManyOptionals {
    inner: ManyOptionals;

    init() {
        self.inner = ManyOptionals{
            x: null,
            y: null,
            z: null,
            s: null,
            t: null,
            flag: null
        };
    }
}
