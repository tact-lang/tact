struct ComplexNested {
    l1: L1;
}

struct L1 {
    l2: L2;
}

struct L2 {
    l3: L3;
}

struct L3 {
    l4: L4;
}

struct L4 {
    i: Int;
    s: String?;
    b: Bool;
}

contract TestContract {
    state: ComplexNested = ComplexNested{
        l1: L1{
            l2: L2{
                l3: L3{
                    l4: L4{
                        i: 23,
                        s: null,
                        b: true
                    }
                }
            }
        }
    };
}