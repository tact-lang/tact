struct Child1 { x: Int; y: Int; }
struct Child2 { z: Bool; s: String; }

struct NestedComplex {
    c1: Child1;
    c2: Child2;
    note: String;
}

contract ManyNestedStructures {
    record: NestedComplex;

    init() {
        self.record = NestedComplex{
            c1: Child1{ x: 1, y: 2 },
            c2: Child2{ z: true, s: "ok" },
            note: "done",
        };
    }
}