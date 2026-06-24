struct Nested {
    x: Int;
    y: Int;
}

struct Outer {
    n: Nested?;
    flag: Bool;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{ n: null, flag: false };
    }
}