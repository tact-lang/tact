struct ManyOptionals {
    a: Int?; b: Int?; c: Int?; d: Int?;
    e: Int?; f: Int?; g: Int?; h: Int?;
    i: Bool?; j: Bool?; k: Bool?; l: Bool?;
    m: Address?; n: Address?;
}

contract NestedManyOptionals {
    nested: ManyOptionals;

    init() {
        self.nested = ManyOptionals{
            a: null, b: null, c: null, d: null,
            e: null, f: null, g: null, h: null,
            i: null, j: null, k: null, l: null,
            m: null, n: null
        };
    }
}