struct Inherit1 { a: Int }
struct Inherit2 { b: Bool }

struct Combine {
    s1: Inherit1;
    s2: Inherit2;
}

contract ComposeStructs {
    field: Combine;

    init() {
        self.field = Combine{ s1: Inherit1{ a: 1 }, s2: Inherit2{ b: false } };
    }
}