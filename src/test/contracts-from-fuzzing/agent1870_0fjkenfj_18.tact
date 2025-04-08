struct Inner {
    flag: Bool;
}

struct Outer {
    val: Int;
    inn: Inner;
}

contract MiddleStorage {
    data: Outer;

    init() {
        self.data = Outer {
            val: 100,
            inn: Inner {
                flag: true
            }
        };
    }
}
