struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract TestContract {
    optionals: ManyOptionals;

    init() {
        self.optionals = ManyOptionals{
            a: null, b: null, c: null, d: null, e: null, f: null
        };
    }
}