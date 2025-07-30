struct NestedManyOptionals {
    nested1: Optionals1?;
    nested2: Optionals2?;
}

struct Optionals1 {
    x: Int?;
    y: Bool?;
}

struct Optionals2 {
    s: String?;
    addr: Address?;
}

contract NestedOpts {
    data: NestedManyOptionals;
    init() {
        self.data = NestedManyOptionals{
            nested1: null,
            nested2: Optionals2{ s: null, addr: null }
        };
    }
}