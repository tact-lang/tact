struct NestedSame {
    x: Int;
}

struct Container {
    a: NestedSame;
    b: NestedSame;
    flag: Bool;
}

contract DupNestedTypes {
    rec: Container;

    init() {
        self.rec = Container{
            a: NestedSame{ x: 5 },
            b: NestedSame{ x: 10 },
            flag: true
        };
    }
}