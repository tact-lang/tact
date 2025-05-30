// Test deeply nested optional structs *with initialization*
struct LevelC { x: Int?; y: String?; }
struct LevelB { c: LevelC?; }
struct LevelA { b: LevelB?; }

contract NestedOptsInit {
    f: LevelA;

    init() {
        self.f = LevelA{
            b: LevelB{
                c: LevelC{
                    x: null,
                    y: null,
                }
            }
        };
    }
}