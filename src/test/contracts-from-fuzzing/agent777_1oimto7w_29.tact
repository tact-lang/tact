struct RecLevel2 {
    val: Int;
}

struct RecLevel1 {
    l2: RecLevel2;
}

struct RecLevel0 {
    l1: RecLevel1;
}

contract RecNestTest {
    r: RecLevel0;

    init() {
        self.r = RecLevel0{
            l1: RecLevel1{
                l2: RecLevel2{
                    val: 123,
                }
            }
        };
    }
}