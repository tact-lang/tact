struct Nested {
    a: Int;
    opt: Inner?;
}

struct Inner {
    val: Int;
}

contract TestOptStructural {
    f: Nested;

    init() {
        self.f = Nested{
            a:5,
            opt:Inner{val:10}
        };
    }
}