struct Nested {
    z: Int;
}

struct Deep {
    nested: Nested;
    optionalNested: Nested?;
}

contract TestContract {
    deep: Deep;

    init() {
        self.deep = Deep{
            nested: Nested{z: 5},
            optionalNested: null,
        };
    }
}
