struct Medium {
    a: Int;
    b: Bool;
}

struct Container {
    m1: Medium;
    m2: Medium;
    m3: Medium;
    optInt: Int?;
    optStr: String?;
}

contract TestContract {
    c: Container;
    init() {
        self.c = Container{
            m1: Medium{ a: 1, b: true },
            m2: Medium{ a: 2, b: false },
            m3: Medium{ a: 3, b: true },
            optInt: null,
            optStr: "done"
        };
    }
}