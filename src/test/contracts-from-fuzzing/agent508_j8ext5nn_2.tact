struct DeepNest {
    i: Int;
    b: Bool;
}

struct MiddleNest {
    d: DeepNest;
    flag: Bool;
}

struct Outer {
    m: MiddleNest;
    number: Int;
}

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{
            m: MiddleNest{
                d: DeepNest{ i: 5, b: false },
                flag: true
            },
            number: 9
        };
    }
}
