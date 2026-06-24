struct L1 {
    a: Int;
}
struct L2 {
    b: Int;
}
struct L3 {
    c: Int;
}
struct Holder {
    l1: L1;
    l2: L2;
    l3: L3;
}

contract MultipleNestedTypes {
    h: Holder;

    init() {
        self.h = Holder{
            l1: L1{a:1},
            l2: L2{b:2},
            l3: L3{c:3}
        };
    }
}
