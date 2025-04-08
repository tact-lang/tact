struct DeepNest3 {
    value: Int = 3;
}

struct DeepNest2 {
    nested3: DeepNest3;
    value: Int = 2;
}

struct DeepNest1 {
    nested2: DeepNest2;
    value: Int = 1;
}

contract TestContract {
    deepField: DeepNest1 = DeepNest1{
        nested2: DeepNest2{
            nested3: DeepNest3{
                value: 3
            },
            value: 2
        },
        value: 1
    };

    init() {
        self.deepField = DeepNest1{
            nested2: DeepNest2{
                nested3: DeepNest3{
                    value:3
                },
                value:2
            },
            value:1
        };
    }
}