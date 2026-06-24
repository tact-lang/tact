struct DeeplyNested {
    inner1: Struct1;
    inner2: Struct2;
}

struct Struct1 {
    foo: Int?;
    bar: Bool;
}

struct Struct2 {
    baz: Int;
    qux: Struct3?;
}

struct Struct3 {
    val: Bool;
}

contract NestedContract {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested{
            inner1: Struct1{foo: null, bar: true},
            inner2: Struct2{
                baz: 7,
                qux: Struct3{val: false},
            },
        };
    }
}