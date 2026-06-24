struct HasManyOptional {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: String?;
    e: Address?;
}

contract TestContract {
    s: HasManyOptional;

    init() {
        self.s = HasManyOptional {
            a: null, b: null, c: null, d: null, e: null
        };
    }
}