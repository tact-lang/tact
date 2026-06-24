struct Inner {
    x: Int;
}

struct Outer1 {
    i: Inner;
}

struct Outer2 {
    j: Outer1;
}

contract MultiContainers {
    one: Outer1;
    two: Outer2;

    init() {
        self.one = Outer1{ i: Inner{x:1} };
        self.two = Outer2{ j: Outer1{ i: Inner{x:2} } };
    }
}