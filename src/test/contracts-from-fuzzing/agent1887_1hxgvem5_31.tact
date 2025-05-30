struct NestedComplex {
    part1: Nested1;
    part2: Nested2;
}

struct Nested1 {
    a: Int; 
    b: Bool; 
    c: Int?;
}

struct Nested2 {
    x: Bool?; 
    y: String; 
    z: Int;
}

contract ComplexNestStorage {
    data: NestedComplex;

    init() {
        self.data = NestedComplex{
            part1: Nested1{ a: 5, b: true, c: null },
            part2: Nested2{ x: null, y: "abc", z: 9 },
        };
    }
}