struct Level4 { d: Int; e: Int?; }
struct Level3 { c: Level4; }
struct Level2 { b: Level3; opt: Level4?; }
struct Level1 { a: Level2; }

contract TestContract {
    data: Level1;

    init() {
        self.data = Level1{
            a: Level2{
                b: Level3{
                    c: Level4{ d: 1, e: null }
                },
                opt: null
            }
        };
    }
}