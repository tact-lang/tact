// Nested struct with many optionals, deep
struct LevelC { x: Int?; y: String?; }
struct LevelB { c: LevelC?; }
struct LevelA { b: LevelB?; }

contract NestedOptionals {
    f: LevelA?;

    init() {
        self.f = null;
    }
}