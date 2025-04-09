struct DeepNested {
    l1: Int;
    l2: Inner1;
}

struct Inner1 {
    l3: Inner2;
}

struct Inner2 {
    l4: Inner3;
}

struct Inner3 {
    l5: Int;
}

contract NestedContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            l1: 1,
            l2: Inner1{
                l3: Inner2{
                    l4: Inner3{
                        l5: 5
                    }
                }
            }
        };
    }
}