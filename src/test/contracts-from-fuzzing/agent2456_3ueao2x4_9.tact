struct InnerMost {
    flag: Bool?;
    count: Int?;
    name: String?;
}

struct Inner {
    meta: InnerMost?;
    label: String;
}

struct Outer {
    nested: Inner?;
    status: Bool?;
}

contract DeepOptions {
    foo: Outer?;

    init() {
        self.foo = null;
    }
}