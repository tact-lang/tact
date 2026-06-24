struct Level5 { val: String; }
struct Level4 { next: Level5; }
struct Level3 { next: Level4; }
struct Level2 { next: Level3; }
struct Level1 { next: Level2; }

contract TestContract {
    deep: Level1;

    init() {
        self.deep = Level1{
            next: Level2{
                next: Level3{
                    next: Level4{
                        next: Level5{
                            val: "bottom"
                        }
                    }
                }
            }
        };
    }

    receive() {}
}