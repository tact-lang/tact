struct DeepNest1 {
    value: Int;
}

struct DeepNest2 {
    prev: DeepNest1;
}

struct DeepNest3 {
    prev: DeepNest2;
}

struct DeepNest4 {
    prev: DeepNest3;
}

contract DeepNestContract {
    dn4: DeepNest4 = DeepNest4{
        prev: DeepNest3{
            prev: DeepNest2{
                prev: DeepNest1{
                    value: 42
                }
            }
        }
    };

    init() {}
}