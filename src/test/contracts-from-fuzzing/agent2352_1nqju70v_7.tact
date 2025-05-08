struct InnerA { a: Int; }
struct InnerB { b: String; }
struct Container {
    x: InnerA?;
    y: InnerB?;
    z: Int;
}

contract OptNestedStructs {
    data: Container;

    init() {
        self.data = Container{
            x: null,
            y: InnerB{ b: "hello" },
            z: 99
        };
    }
}