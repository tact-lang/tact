struct Inner1 {
    foo: Int;
}

struct Inner2 {
    bar: Bool?;
}

struct Middle {
    a: Inner1;
    b: Inner2;
}

contract DeepAndWide {
    storage: Middle;

    init() {
        self.storage = Middle{
            a: Inner1{ foo: 100 },
            b: Inner2{ bar: true },
        };
    }
}