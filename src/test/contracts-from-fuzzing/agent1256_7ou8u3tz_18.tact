struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract PersistentNullOptionals {
    s: ManyOptionals;

    init() {
        self.s = ManyOptionals{
            a: null,
            b: null,
            c: null,
        };
    }
}