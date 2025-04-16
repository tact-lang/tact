struct Nested {
    a: Int;
    b: Int;
}

struct Container {
    nested: Nested;
    optVal: Int?;
    mapVal: map<Int, Int>;
}

contract Test {
    field: Container;

    init() {
        self.field = Container{
            nested: Nested{
                a: 1,
                b: 2
            },
            optVal: null,
            mapVal: emptyMap()
        };
    }
}