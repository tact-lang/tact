struct DeepNester {
    nest1: Nested1;
}

struct Nested1 {
    nest2: Nested2;
}

struct Nested2 {
    nest3: Nested3;
}

struct Nested3 {
    x: Int;
    y: Bool;
}

contract TestContract {
    storage: DeepNester = DeepNester{
        nest1: Nested1{
            nest2: Nested2{
                nest3: Nested3{
                    x: 7,
                    y: true,
                },
            },
        },
    };

    init() {}
}