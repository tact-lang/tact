struct Sub {
    a: Int;
    b: Bool;
}

struct Container {
    f1: Sub;
    f2: Sub;
    f3: Sub;
}

contract MultipleNestedSame {
    val: Container;

    init() {
        self.val = Container{
            f1: Sub{a: 1, b: true},
            f2: Sub{a: 2, b: false},
            f3: Sub{a: 3, b: true}
        };
    }
}