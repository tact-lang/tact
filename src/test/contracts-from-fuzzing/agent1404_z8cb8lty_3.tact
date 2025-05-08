struct Sub {
    x: Int;
    y: String;
}

struct Container {
    a: Int;
    b: String;
    c: Bool;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Sub;
    h: Sub;
}

contract TestComplexStruct {
    data: Container;

    init() {
        self.data = Container{
            a: 10,
            b: "foo",
            c: true,
            d: 42,
            e: null,
            f: "bar",
            g: Sub{x:1,y:"x"},
            h: Sub{x:2,y:"y"},
        };
    }
}
