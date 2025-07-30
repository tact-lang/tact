struct Deep {
    a: Int as uint8 = 1;
    b: Int as uint16 = 2;
}

struct Container {
    d: Deep;
    name: String = "x";
}

contract Test28 {
    data: Container;

    init() {
        self.data = Container{
            d: Deep{},
        };
    }
}