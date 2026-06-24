struct Example {
    a: Int; b: Int;
}

contract AssignFieldOrder {
    f: Example;

    init() {
        self.f = Example{b:2,a:1};
    }
}