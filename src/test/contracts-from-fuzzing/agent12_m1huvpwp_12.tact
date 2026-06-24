struct Innermost {
    x: Int;
}

struct Inner {
    node: Innermost?;
    y: Bool;
}

struct Outer {
    innerOpt: Inner?;
    label: String;
}

contract TestContract {
    data: Outer?;

    init() {
        self.data = null;
    }
}