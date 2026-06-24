struct BigNest1 {
    v1: Int;
    v2: Int;
}

struct BigNest2 {
    n1: BigNest1;
    v3: Int;
}

struct BigNest3 {
    n2: BigNest2;
    v4: Int;
}

struct BigNest4 {
    n3: BigNest3;
    v5: Int;
}

struct BigNest5 {
    n4: BigNest4;
    v6: Int;
}

contract DeepMultilevel {
    nestedStruct: BigNest5;

    init() {
        self.nestedStruct = BigNest5{
            n4: BigNest4{
                n3: BigNest3{
                    n2: BigNest2{
                        n1: BigNest1{
                            v1: 1, v2: 2
                        },
                        v3: 3
                    },
                    v4: 4
                },
                v5: 5
            },
            v6: 6
        };
    }
}