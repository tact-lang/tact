// Optional struct with deeply nested optional struct inside it
struct Inner {
    a: Int?;
}

struct Outer {
    i: Inner?;
}

contract OptDeepNest {
    o: Outer?;

    init() {
        self.o = null;
    }
}