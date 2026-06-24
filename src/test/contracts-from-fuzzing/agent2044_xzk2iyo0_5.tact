struct DeepInner {
    s: String;
    b: Bool?;
}

struct Mid {
    a: DeepInner;
    n: Int?;
}

struct Container {
    first: Mid;
    second: Mid?;
    s2: String;
}

contract ContainerContract {
    box: Container;
    init() {
        self.box = Container{
            first: Mid{a: DeepInner{s: "x", b: null}, n: null},
            second: null,
            s2: "done",
        };
    }
}