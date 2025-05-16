struct Level4 { a: Int; b: Bool }
struct Level3 { x: Level4; y: Level4 }
struct Level2 { m: Level3; n: Level3 }
struct Level1 { p: Level2; q: Level2 }

contract TowerContract {
    state: Level1;
    init() {
        self.state = Level1{
            p: Level2{
                m: Level3{ x: Level4{a:1,b:true}, y: Level4{a:2,b:false} },
                n: Level3{ x: Level4{a:3,b:true}, y: Level4{a:4,b:false} }
            },
            q: Level2{
                m: Level3{ x: Level4{a:5,b:true}, y: Level4{a:6,b:false} },
                n: Level3{ x: Level4{a:7,b:true}, y: Level4{a:8,b:false} }
            }
        };
    }
}
