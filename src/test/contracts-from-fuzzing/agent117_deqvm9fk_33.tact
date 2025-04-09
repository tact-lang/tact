struct Sub {
    a: Int;
}

struct OuterSub {
    sub1: Sub;
    sub2: Sub;
}

contract LargeNested {
    nested1: OuterSub;
    nested2: OuterSub;

    init() {
        self.nested1 = OuterSub{sub1: Sub{a: 1}, sub2: Sub{a: 2}};
        self.nested2 = OuterSub{sub1: Sub{a: 3}, sub2: Sub{a: 4}};
    }
}
