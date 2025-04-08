struct Union {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract OptionalUnion {
    u: Union;

    init() {
        self.u = Union{
            a: null,
            b: null,
            c: null
        };
    }
}