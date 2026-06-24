struct NestedLevel3 {
    foo: Int;
}

struct NestedLevel2 {
    bar: NestedLevel3;
    optionalBar: NestedLevel3?;
}

struct NestedLevel1 {
    baz: NestedLevel2;
    optionalBaz: NestedLevel2?;
}

contract DeepNestedTest {
    data: NestedLevel1;

    init() {
        self.data = NestedLevel1{
            baz: NestedLevel2{
                bar: NestedLevel3{foo: 1},
                optionalBar: null,
            },
            optionalBaz: null,
        };
    }
}
