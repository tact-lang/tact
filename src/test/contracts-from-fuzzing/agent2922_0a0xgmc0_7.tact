struct Inner1 {
    a: Int;
    b: Bool;
}

struct Inner2 {
    x: String;
    y: Cell;
}

struct Outer {
    opt1: Inner1?;
    opt2: Inner2?;
    z: Bool;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer {
            opt1: null,
            opt2: null,
            z: false
        };
    }
}