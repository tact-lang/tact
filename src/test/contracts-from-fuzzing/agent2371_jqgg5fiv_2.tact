struct Nested2 { g: Bool; }

struct Nested1 { f: Bool; n2: Nested2; }

contract TestContract {
    nested: Nested1;

    init() {
        self.nested = Nested1{
            f: true,
            n2: Nested2{ g: false },
        };
    }
}