struct SuperNested {
    a: Int;
}

struct L2 {
    sn: SuperNested;
}

struct L3 {
    l2: L2;
}

struct L4 {
    l3: L3;
}

struct L5 {
    l4: L4;
}

struct L6 {
    l5: L5;
}

struct L7 {
    l6: L6;
}

contract DeepSeven {
    deep: L7;

    init() {
        self.deep = L7{ l6:L6{ l5:L5{ l4:L4{ l3:L3{ l2:L2{ sn:SuperNested{ a:555 } } } } } } };
    }
}
