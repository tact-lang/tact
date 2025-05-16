struct S1 {
    a: Int;
}

struct S2 {
    b: Int;
}

struct Container {
    sa: S1;
    sb: S2;
}

contract MultiNested {
    data: Container;
    init() {
        self.data = Container{
            sa: S1{a: 1},
            sb: S2{b: 2}
        };
    }
}