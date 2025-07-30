struct Level3 { val: Int }
struct Level2 { c: Level3? }
struct Level1 { b: Level2? }

contract TestContract {
    nestedOpt: Level1;

    init() {
        self.nestedOpt = Level1{
            b: Level2{
                c: Level3{
                    val: 42
                }
            }
        };
    }
}
