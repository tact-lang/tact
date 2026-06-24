struct Sub {
    val: Int;
}

struct Outer {
    sub1: Sub;
    sub2: Sub;
    sub3: Sub;
}

contract MultipleNestedSameType {
    o: Outer;

    init() {
        self.o = Outer{
            sub1: Sub{val: 1},
            sub2: Sub{val: 2},
            sub3: Sub{val: 3},
        };
    }
}