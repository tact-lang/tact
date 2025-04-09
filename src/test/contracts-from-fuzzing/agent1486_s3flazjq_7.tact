struct One {
    value: Int;
}

struct Two {
    one1: One;
    one2: One;
    one3: One;
}

contract ManyNested {
    data: Two;

    init() {
        self.data = Two{
            one1: One{ value: 1 },
            one2: One{ value: 2 },
            one3: One{ value: 3 }
        };
    }
}
