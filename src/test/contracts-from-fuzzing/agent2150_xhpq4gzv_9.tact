// Intentionally partial defaults in nested structs
struct NestedDefault {
    a: Int = 1;
    b: Int;
}

struct TopLevel {
    nested: NestedDefault;
}

contract TestContract {
    f: TopLevel;

    init() {
        self.f = TopLevel{
            nested: NestedDefault{
                b: 99
            }
        };
    }
}