struct Under {
    s: String = "hello";
    b: Bool = false;
}

struct Container {
    intVal: Int = 5;
    inner1: Under;
    inner2: Under;
}

contract NestedDup {
    data: Container;

    init() {
        self.data = Container{
            intVal: 7,
            inner1: Under{s: "one", b: true},
            inner2: Under{s: "two", b: false}
        };
    }
}