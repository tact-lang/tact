struct LevelA { a: Int; }
struct LevelB { b: LevelA; }
struct LevelC { c: LevelB; }

contract LevelNest {
    data: LevelC;

    init() {
        self.data = LevelC{
            c: LevelB{
                b: LevelA{
                    a: 42
                }
            }
        };
    }
}