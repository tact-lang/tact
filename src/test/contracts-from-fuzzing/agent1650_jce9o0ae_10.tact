struct Inner1 {
    val: Int;
}

struct Inner2 {
    val: Int;
}

struct Inner3 {
    val: Int;
}

struct Container {
    f1: Inner1;
    f2: Inner2;
    f3: Inner3;
}

contract MultiNested {
    state: Container;

    init() {
        self.state = Container{
            f1: Inner1{val:1},
            f2: Inner2{val:2},
            f3: Inner3{val:3}
        };
    }
}