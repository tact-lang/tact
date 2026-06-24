struct RecursiveDeep2 {
    f: Int;
}

struct RecursiveDeep1 {
    d: RecursiveDeep2;
}

struct RecursiveRoot {
    c: RecursiveDeep1;
}

contract RecursiveContract {
    root: RecursiveRoot;

    init() {
        self.root = RecursiveRoot{
            c: RecursiveDeep1{
                d: RecursiveDeep2{ f: 42 }
            }
        };
    }
}