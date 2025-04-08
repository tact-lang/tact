// Deeply nested three levels
struct Level1 {
    l2: Level2;
}

struct Level2 {
    l3: Level3;
}

struct Level3 {
    val: Int;
    flag: Bool;
}

contract TestContract {
    data: Level1;

    init() {
        self.data = Level1{
            l2: Level2{
                l3: Level3{
                    val: 123,
                    flag: true
                }
            }
        };
    }
}