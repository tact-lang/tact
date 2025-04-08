struct Nested1 {
    x: Int;
    y: Int?;
}

struct Nested2 {
    child: Nested1;
    z: Bool;
}

contract DeepNestedStorage {
    nest: Nested2;

    init() {
        self.nest = Nested2{
            child: Nested1{ x: 1, y: null },
            z: true,
        };
    }
}