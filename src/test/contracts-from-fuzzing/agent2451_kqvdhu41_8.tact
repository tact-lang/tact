struct NestedLayer3 {
    value: Int; 
}

struct NestedLayer2 {
    l3: NestedLayer3;
    optInt: Int?;
}

struct NestedLayer1 {
    l2: NestedLayer2;
    flag: Bool;
}

contract MultiNested {
    complex: NestedLayer1;

    init() {
        self.complex = NestedLayer1{
            l2: NestedLayer2{
                l3: NestedLayer3{ value: 42 },
                optInt: null
            },
            flag: true
        };
    }
}