struct MidNested {
    a: Int;
    b: Bool;
}

struct Container {
    mid: MidNested;
    c: String;
}

contract NestedInside {
    data: Container;

    init() {
        self.data = Container{
            mid: MidNested{ a:10, b: true },
            c: "abc",
        };
    }
}
