struct Inner {
    foo: Int;
    bar: String;
}

struct Outer {
    nested: Inner;
    flag: Bool;
}

contract TestStorage {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Inner{
                foo: 1,
                bar: "hello",
            },
            flag: true,
        };
    }
}
