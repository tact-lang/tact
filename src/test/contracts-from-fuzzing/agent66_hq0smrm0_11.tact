struct Inner {
    flag: Bool;
    note: String;
}

struct Outer {
    data: Inner?;
}

struct Container {
    wrap: Outer;
}

contract Test {
    x: Container;
    init() {
        self.x = Container{
            wrap: Outer{
                data: Inner{
                    flag: true,
                    note: "hi",
                },
            },
        };
    }
}
