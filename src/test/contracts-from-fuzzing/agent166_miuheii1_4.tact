struct Deep {
    a: Int;
    b: String?;
}

struct Layer3 {
    d: Deep;
}

struct Layer2 {
    l3: Layer3;
}

struct Layer1 {
    l2: Layer2;
}

contract OptionalDeepNest {
    storage: Layer1?;

    init() {
        self.storage = Layer1{
            l2: Layer2{
                l3: Layer3{
                    d: Deep{
                        a: 7,
                        b: "nest",
                    }
                }
            }
        };
    }
}