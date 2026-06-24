struct Nested1 { f: Int }
struct Nested2 { g: Bool }
struct Mid {
    d: Int;
    e: Nested1;
    h: Nested2;
}

contract MultiStructNest {
    data: Mid;

    init() {
        self.data = Mid{
            d: 10,
            e: Nested1{ f: 42 },
            h: Nested2{ g: true }
        };
    }
}