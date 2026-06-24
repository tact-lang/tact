struct Inner {
    flag: Bool;
    name: String;
}

struct Outer {
    inner: Inner;
    description: String?;
}

contract ManyNested {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                flag: true,
                name: "Bob",
            },
            description: null,
        };
    }
}