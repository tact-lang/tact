struct OptionalNested {
    nested: StructA?;
}

struct StructA {
    f: Int;
}

contract TestContract {
    optNest: OptionalNested;
    init() {
        self.optNest = OptionalNested{
            nested: null
        };
    }
}