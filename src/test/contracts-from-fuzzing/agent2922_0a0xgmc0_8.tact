struct DeepOptOpt {
    x: Outer?;
    flag: Bool;
}

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
    data: DeepOptOpt;

    init() {
        self.data = DeepOptOpt {
            x: null,
            flag: true
        };
    }
}