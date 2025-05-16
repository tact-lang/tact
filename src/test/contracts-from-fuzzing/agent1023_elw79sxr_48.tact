struct RecSub {
    foo: Int;
}

struct RecursiveAgain {
    bar: RecSub;
}

contract MultiLevelRecursive {
    top: RecursiveAgain;
    init() {
        self.top = RecursiveAgain{ bar: RecSub{ foo: 100 } };
    }
}