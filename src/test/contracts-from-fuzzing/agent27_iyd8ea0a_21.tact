struct Container {
    nested1: Nested1;
    nested2: Nested2;
}

struct Nested1 {
    x: Int;
    y: Bool?;
}

struct Nested2 {
    a: String;
    b: Int?;
}

contract MultiNest {
    data: Container;

    init() {
        self.data = Container{
            nested1: Nested1{x: 1, y: null},
            nested2: Nested2{a: "test", b: null}
        };
    }
}