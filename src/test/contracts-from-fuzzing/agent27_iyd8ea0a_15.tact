struct Sub1 {
    a: Int;
}

struct Sub2 {
    b: Int;
}

struct Sub3 {
    c: Int;
}

struct NestedGroup {
    sub1: Sub1;
    sub2: Sub2;
    sub3: Sub3;
}

contract GroupedNested {
    data: NestedGroup;

    init() {
        self.data = NestedGroup{
            sub1: Sub1{a: 1},
            sub2: Sub2{b: 2},
            sub3: Sub3{c: 3}
        };
    }
}