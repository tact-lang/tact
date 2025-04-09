struct HasOptionals {
    x: Int?;
    y: Bool?;
    z: Address?;
}

struct Container {
    f1: HasOptionals;
    f2: Int;
}

contract Test7 {
    data: Container;
    init() {
        self.data = Container{
            f1: HasOptionals{
                x: 10,
                y: null,
                z: myAddress(),
            },
            f2: 42,
        };
    }
}