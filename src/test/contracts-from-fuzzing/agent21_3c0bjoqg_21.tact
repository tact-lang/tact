struct InnerMost {
    x: Int;
    y: Bool;
}

struct MidStruct {
    inner: InnerMost;
}

struct OuterStruct {
    mid: MidStruct;
}

struct Container {
    outer: OuterStruct? = null;
    id: Int;
    flag: Bool;
}

contract Test {
    state: Container;

    init() {
        self.state = Container{
            id: 10,
            flag: true
        };
    }
}