struct Layer4 {
    d: Int;
}

struct Layer3 {
    l4: Layer4;
}

struct Layer2 {
    l3: Layer3;
}

struct Layer1 {
    l2: Layer2;
}

contract DeepNestedStructs {
    nest: Layer1;

    init() {
        self.nest = Layer1{
            l2: Layer2{
                l3: Layer3{
                    l4: Layer4{
                        d: 123,
                    },
                },
            },
        };
    }
}
