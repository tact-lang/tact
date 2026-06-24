struct S1 {
    a: Int?;
    b: Bool?;
}

struct Container {
    s: S1?;
    i: Int;
}

contract PartialAssign {
    store: Container?;
    init() {
        self.store = Container{
            s: null,
            i: 100
        };
    }
}