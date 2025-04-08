struct Level3 {
    val1: Bool;
    val2: Int;
    val3: String;
}

struct Level2 {
    nest1: Level3;
    nest2: Level3;
}

struct Level1 {
    embed1: Level2;
    embed2: Level2;
}

contract Test {
    data: Level1;

    init() {
        self.data = Level1{
            embed1: Level2{
                nest1: Level3{val1: true, val2: 1, val3:"a"},
                nest2: Level3{val1: false, val2: 2, val3:"b"},
            },
            embed2: Level2{
                nest1: Level3{val1: true, val2: 3, val3:"c"},
                nest2: Level3{val1: false, val2: 4, val3:"d"},
            }
        };
    } 
}