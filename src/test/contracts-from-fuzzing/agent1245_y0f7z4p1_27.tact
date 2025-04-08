struct A {
    foo: Int;
    bar: String;
}

struct B {
    nested: A?;
    flag: Bool;
}

struct C {
    higher: B;
    data: Int;
}

contract MultiLayers {
    layer: C;

    init() {
        self.layer = C{
            higher: B{
                nested: null,
                flag: false,
            },
            data: 42,
        };
    }
}
