struct Mid1 { f1: Int; }
struct Mid2 { f2: Bool; }

struct Top {
    x: Mid1;
    y: Mid2;
}

contract NestedStructs {
    data: Top;

    init() {
        self.data = Top{
            x: Mid1{ f1: 5 },
            y: Mid2{ f2: true }
        };
    }
}