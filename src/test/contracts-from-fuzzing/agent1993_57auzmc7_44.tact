struct Inner {
    x: Int;
}

struct Outer {
    i: Int;
    inn: Inner?;
}

contract TestContract {
    o: Outer?;

    init() {
        self.o = null;
    }
}