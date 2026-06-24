struct DeepNest {
    inner: Layer1;
}

struct Layer1 {
    l2: Layer2;
}

struct Layer2 {
    l3: Layer3;
}

struct Layer3 {
    value: Int;
    flag: Bool;
}

contract TestDeep {
    d: DeepNest;

    init() {
        self.d = DeepNest{
            inner: Layer1{
                l2: Layer2{
                    l3: Layer3{
                        value: 123,
                        flag: true,
                    },
                },
            },
        };
    }
}
