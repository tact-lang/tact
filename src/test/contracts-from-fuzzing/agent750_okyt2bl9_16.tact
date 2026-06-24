struct RecursiveOne {
    inner: RecursiveTwo;
}

struct RecursiveTwo {
    inner2: RecursiveThree;
}

struct RecursiveThree {
    val: Int;
}

contract DeeplyRecursive {
    data: RecursiveOne;

    init() {
        self.data = RecursiveOne{
            inner: RecursiveTwo{
                inner2: RecursiveThree{
                    val: 99
                }
            }
        };
    }
}
