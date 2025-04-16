struct Nested1 {
    a: String?;
}

struct Nested2 {
    b: Nested1?;
}

contract DeepOptionalChains {
    x: Nested2;

    init() {
        self.x = Nested2{ b: null };
    }
}
