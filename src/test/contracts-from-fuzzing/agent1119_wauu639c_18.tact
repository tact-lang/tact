// Test dense optionals in nested structs
struct LevelTwo {
    foo: Int?;
    bar: Bool?;
}

struct LevelOne {
    nest: LevelTwo?;
}

contract NestedOptional {
    data: LevelOne;

    init() {
        self.data = LevelOne{nest: LevelTwo{foo: null, bar: null}};
    }
}