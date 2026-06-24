struct RecursiveLevel1 {
    sub: RecursiveLevel2;
}

struct RecursiveLevel2 {
    sub: RecursiveLevel3;
}

struct RecursiveLevel3 {
    data1: Int;
    data2: Bool;
}

contract RecursiveNestedContract {
    rec: RecursiveLevel1;

    init() {
        self.rec = RecursiveLevel1{
            sub: RecursiveLevel2{
                sub: RecursiveLevel3{
                    data1: 55,
                    data2: true
                }
            }
        };
    }
}