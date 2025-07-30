struct InnerA {
    val: Int?;
}

struct InnerB {
    flag: Bool;
}

struct Middle {
    a: InnerA;
    b: InnerB?;
}

contract CrossOptionals {
    store: Middle;

    init() {
        self.store = Middle{
            a: InnerA{ val: null },
            b: null
        };
    }
}