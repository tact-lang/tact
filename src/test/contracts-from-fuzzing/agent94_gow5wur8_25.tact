// optional containing nested optional struct instance
struct Inner {
    foo: Int?;
}

struct Outer {
    nested: Inner?;
    bar: Int?;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Inner{ foo: null },
            bar: null
        };
    }
}