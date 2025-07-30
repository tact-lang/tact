struct RecLevel3 {
    val3: Int;
}
struct RecLevel2 {
    val2: Int;
    next: RecLevel3;
}
struct RecLevel1 {
    val1: Int;
    next: RecLevel2;
}

contract RecursiveStructs {
    root: RecLevel1;

    init() {
        self.root = RecLevel1{
            val1: 1,
            next: RecLevel2{
                val2: 2,
                next: RecLevel3{
                    val3: 3
                }
            }
        };
    }
}