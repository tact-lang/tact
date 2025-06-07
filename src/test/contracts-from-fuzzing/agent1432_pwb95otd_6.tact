struct Level3 {
    val3: Int;
    flag3: Bool;
}

struct Level2 {
    val2: String;
    nested3: Level3;
}

struct Level1 {
    val1: Int;
    nested2: Level2;
}

contract TestContract {
    nested1: Level1;

    init() {
        self.nested1 = Level1{
            val1: 1,
            nested2: Level2{
                val2: "abc",
                nested3: Level3{ val3: 3, flag3: true }
            }
        };
    }
}