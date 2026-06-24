struct ManyOptional { a: Int?; b: Bool?; c: String?; d: Address?; e: Cell?; }

contract OptionalManyFields {
    foo: ManyOptional;

    init() {
        self.foo = ManyOptional{ a: null, b: null, c: null, d: null, e: null };
    }
}
