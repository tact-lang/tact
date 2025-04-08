// Cross test defaults and nested optional in inner level
struct Inner {
    a: Int?;
    b: Bool = true;
}

struct Outer {
    nested: Inner?;
    s: String?;
}

contract CrossDefaultsInnerOpt {
    data: Outer;

    init() {
        self.data = Outer{
            nested: null,
            s: null
        };
    }
}