struct Deep {
    name: String;
    enabled: Bool?;
    magic: Int = 777;
}

struct Container {
    d: Deep?;
    count: Int = 0;
}

contract MixedLayers {
    a: Int = 1;
    b: Int?;
    c: Container;

    init() {
        self.a = 10;
        self.b = 42;
        self.c = Container{
            d: Deep{
                name: "deep",
                enabled: true,
                magic: 123,
            },
            count: 1,
        };
    }

    receive() {}
}