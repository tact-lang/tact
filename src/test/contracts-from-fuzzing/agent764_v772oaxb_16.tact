struct Layer1 {
    x: Int;
    l2: Layer2;
}

struct Layer2 {
    y: Int;
    l3: Layer3;
}

struct Layer3 {
    z: Int;
    l4: Layer4;
}

struct Layer4 {
    t: Int;
}

contract DeeplyNestedData {
    data: Layer1;

    init() {
        self.data = Layer1{
            x: 1,
            l2: Layer2{
                y: 2,
                l3: Layer3{
                    z: 3,
                    l4: Layer4{
                        t: 4
                    }
                }
            }
        };
    }
}