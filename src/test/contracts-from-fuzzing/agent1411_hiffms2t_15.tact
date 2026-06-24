// many layers of optional nested smart pointers
struct Level1 { val: Int? }
struct Level2 { val: Level1? }
struct Level3 { val: Level2? }
struct Level4 { val: Level3? }

contract TestContract {
    data: Level4;
    init() {
        self.data = Level4{
            val: null
        };
    }
}