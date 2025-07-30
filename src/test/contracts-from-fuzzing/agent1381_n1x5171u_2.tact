struct Level3 { c: Int; d: String?; }
struct Level2 { b: Int; sub: Level3; }
struct Level1 { a: Int; sub: Level2; }

contract MultiLevelNested {
    root: Level1;

    init() {
        self.root = Level1{
            a: 1,
            sub: Level2{
                b: 2,
                sub: Level3{
                    c:3,
                    d:null
                }
            }
        };
    }
}