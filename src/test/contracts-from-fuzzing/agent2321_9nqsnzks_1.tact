struct Inner {
    x: Int;
    y: Int;
}

struct Outer {
    point: Inner;
    flag: Bool;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{point: Inner{x:1, y:2}, flag: true};
    }
}