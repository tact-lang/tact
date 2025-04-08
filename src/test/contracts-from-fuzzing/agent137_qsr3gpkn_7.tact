struct RecursiveLevel2 { leaf: Int }

struct RecursiveLevel1 {
    optLeaf: RecursiveLevel2?;
}

struct RecursiveRoot {
    optMid: RecursiveLevel1?;
}

contract RecursiveOptionalsTest {
    root: RecursiveRoot;

    init() {
        self.root = RecursiveRoot{
            optMid: RecursiveLevel1{
                optLeaf: RecursiveLevel2{
                    leaf: 99
                }
            }
        };
    }

    receive() {}
}