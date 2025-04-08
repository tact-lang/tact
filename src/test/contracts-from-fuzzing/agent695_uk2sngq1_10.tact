struct Inner {
    flag: Bool;
}

struct Container {
    opt: Inner?;
    text: String;
}

contract OptionalStructInStruct {
    c: Container;

    init() {
        self.c = Container{
            opt: Inner{ flag: true },
            text: "x",
        };
    }
}