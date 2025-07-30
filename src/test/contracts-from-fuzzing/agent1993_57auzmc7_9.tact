struct Inner {
    flag: Bool;
    str: String;
}

struct Outer {
    f1: Int;
    nested: Inner?;
    f2: Int;
}

contract TestContract {
    o: Outer;

    init() {
        self.o = Outer{ f1: 1, nested: null, f2: 2 };
    }
}