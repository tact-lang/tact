struct OptDeep {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
    f: Int?;
}

contract OptStorage {
    state: OptDeep;

    init() {
        self.state = OptDeep{
            a: 1,
            b: null,
            c: 3,
            d: null,
            e: 5,
            f: 6
        };
    }
}