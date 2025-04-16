struct ManyOptional {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Address?;
}

contract MultipleOptionals {
    m: ManyOptional;
    init() {
        self.m = ManyOptional{ a: null, b: null, c: null, d: null };
    }
}