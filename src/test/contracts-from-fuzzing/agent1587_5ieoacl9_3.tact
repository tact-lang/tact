struct Nested1 {
    x: Int;
}

struct Nested2 {
    y: Bool;
}

struct Nested3 {
    z: String;
}

struct Container {
    n1: Nested1;
    n2: Nested2;
    n3: Nested3;
}

contract MultipleNestedStructs {
    stored: Container;

    init() {
        self.stored = Container{
            n1: Nested1{x: 1},
            n2: Nested2{y: true},
            n3: Nested3{z: "hello"},
        };
    }
}