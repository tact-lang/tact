struct Child {
    val: Int;
}

struct Middle {
    child: Child;
    count: Int;
}

struct Top {
    payload: Middle;
    flag: Bool;
}

contract TripleNest {
    storage: Top;

    init() {
        self.storage = Top{
            payload: Middle{
                child: Child{ val: 42 },
                count: 5
            },
            flag: true
        };
    }
}