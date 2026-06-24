struct Small {
    a: Int;
    b: String;
}

struct Container {
    inner: Small?;
    flag: Bool;
}

contract OptStructInStruct {
    storage: Container;

    init() {
        self.storage = Container{
            inner: Small{
                a: 11,
                b: "xyz",
            },
            flag: true,
        };
    }
}