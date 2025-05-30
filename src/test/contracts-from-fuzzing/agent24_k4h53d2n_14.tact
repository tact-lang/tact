struct RecursiveLevel1 {
    lvl2: RecursiveLevel2;
}

struct RecursiveLevel2 {
    lvl3: RecursiveLevel3;
}

struct RecursiveLevel3 {
    val: Int;
}

contract DeepRecursiveFields {
    data: RecursiveLevel1;

    init() {
        self.data = RecursiveLevel1{
            lvl2: RecursiveLevel2{
                lvl3: RecursiveLevel3 {
                    val: 123
                }
            }
        };
    }
}