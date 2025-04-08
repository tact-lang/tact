struct Sub {
    value: Int;
}

struct Parent {
    p1: Sub;
    p2: Sub;
    p3: Sub;
}

contract NestedContract {
    data1: Parent;
    data2: Parent;

    init() {
        self.data1 = Parent{
            p1: Sub{value:1},
            p2: Sub{value:2},
            p3: Sub{value:3}
        };
        self.data2 = Parent{
            p1: Sub{value:4},
            p2: Sub{value:5},
            p3: Sub{value:6}
        };
    }
}