struct OptNested {
    i: Int?;
    s: String?;
}

struct OuterOpt {
    nested: OptNested?;
}

contract Test {
    data: OuterOpt;
    init() {
        self.data = OuterOpt{
            nested: null
        };
    }
}