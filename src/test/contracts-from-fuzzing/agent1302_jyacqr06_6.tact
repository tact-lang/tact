struct InnerA {
    a: Int?;
    b: Bool;
}

struct InnerB {
    s: String;
    optB: Bool?;
}

struct Middle {
    left: InnerA;
    right: InnerB;
    flag: Bool;
}

contract NestedTree {
    storage: Middle;

    init() {
        self.storage = Middle{
            left: InnerA{ a: null, b: true },
            right: InnerB{ s: "test", optB: false },
            flag: true
        };
    }

    receive() {
        let lv = self.storage.left.a;
        let rv = self.storage.right.optB;
        let f = self.storage.flag;
    }
}
