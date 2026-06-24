struct Child1 {
    f: Int;
}

struct Child2 {
    f: Int;
}

struct Child3 {
    f: Int;
}

struct Container {
    c1: Child1;
    c2: Child2;
    c3: Child3;
}

contract MultiNestedTest {
    data: Container;

    init() {
        self.data = Container{
            c1: Child1{f:1},
            c2: Child2{f:2},
            c3: Child3{f:3}
        };
    }
}
