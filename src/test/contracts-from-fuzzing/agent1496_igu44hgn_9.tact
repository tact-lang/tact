struct S1 {
    val: Int;
}

struct S2 {
    val: Bool;
}

struct Container {
    s1: S1?;
    s2: S2?;
}

contract TestContract {
    x: Container;
    init() {
        self.x = Container{
            s1: null,
            s2: null
        };
    }
}