struct RecLevel3 {
    val3: Int;
}

struct RecLevel2 {
    val2: Int;
    lvl3: RecLevel3;
}

struct RecLevel1 {
    val1: Int;
    lvl2: RecLevel2;
}

contract TestContract {
    root: RecLevel1;

    init() {
        self.root = RecLevel1{
            val1:1,
            lvl2: RecLevel2{
                val2:2,
                lvl3:RecLevel3{val3:3}
            }
        };
    }
}