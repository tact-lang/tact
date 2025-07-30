struct Flat {
    a: Int;
    b: Int;
    c: Int;
}

struct Container {
    x: Flat;
    y: Flat;
    z: Flat;
}

contract FlatFields {
    data: Container;

    init() {
        self.data = Container{
            x: Flat{ a:1, b:2, c:3 },
            y: Flat{ a:4, b:5, c:6 },
            z: Flat{ a:7, b:8, c:9 },
        };
    }
}