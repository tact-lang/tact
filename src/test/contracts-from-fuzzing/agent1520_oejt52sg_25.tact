struct OptionalTop {
    nested: OptionalNested?;
}

struct OptionalNested {
    s: String?;
    i: Int?;
    b: Bool?;
}

contract OptTopTest {
    var: OptionalTop;
    init() {
        self.var = OptionalTop{
            nested: OptionalNested{
                s: null,
                i: null,
                b: null
            }
        };
    }
}