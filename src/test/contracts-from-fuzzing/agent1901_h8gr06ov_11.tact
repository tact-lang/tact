struct Layer3 {
    z: String?;
}

struct Layer2 {
    y: Bool = true;
    l3: Layer3;
}

struct Layer1 {
    x: Int = 9;
    l2: Layer2;
}

contract NestedLayered {
    test: Layer1;

    init() {
        self.test = Layer1{
            x: 123,
            l2: Layer2{
                y: false,
                l3: Layer3{
                    z: null
                }
            }
        };
    }
}