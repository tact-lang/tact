struct Inner {
    foo: Int;
    bar: Bool;
}

struct Outer {
    nestedOpt: Inner?;
    label: String;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            nestedOpt: Inner{
                foo: 42,
                bar: true
            },
            label: "StructOpt"
        };
    }
}