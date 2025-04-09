struct OptionalNested {
    s: String?;
    i: Int;
}

struct Top {
    a: OptionalNested?;
}

contract Test {
    data: Top;
    init() {
        self.data = Top{
            a: null
        };
    }
}