struct LevelX {
    a: Int;
    sub: SubLevelX;
}

struct SubLevelX {
    b: Int?;
    z: Bool;
}

contract NestedX {
    payload: LevelX;

    init() {
        self.payload = LevelX{ a: 5, sub: SubLevelX{ b: null, z: true } };
    }
}
