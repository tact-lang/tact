struct Inner {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

struct Outer {
    inner1: Inner;
    inner2: Inner;
    flag: Bool;
}

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{
            inner1: Inner{foo: null, bar: null, baz: null},
            inner2: Inner{foo: 5, bar: true, baz: "hi"},
            flag: true,
        };
    }
}