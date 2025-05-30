struct DeepNested {
    d: Int;
    optd: Int?;
}

struct Nested {
    c: Int;
    optc: Int?;
    deep: DeepNested;
}

struct Container {
    b: Int;
    optb: Int?;
    nested: Nested;
}

contract TestContract {
    a: Container;

    init() {
        self.a = Container{
            b: 1,
            optb: null,
            nested: Nested{
                c: 2,
                optc: null,
                deep: DeepNested{ d:3, optd: null }
            }
        };
    }
}