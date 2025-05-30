struct Level5 { val: Int? }
struct Level4 { sub: Level5? }
struct Level3 { sub: Level4? }
struct Level2 { sub: Level3? }
struct Level1 { sub: Level2? }

contract Nested {
    root: Level1?; 

    init() {
        self.root = Level1{
            sub: Level2{
                sub: Level3{
                    sub: Level4{
                        sub: Level5{ val: null }
                    }
                }
            }
        };
    }
}