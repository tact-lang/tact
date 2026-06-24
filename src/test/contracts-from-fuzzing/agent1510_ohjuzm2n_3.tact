struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    i: Inner;
    flag: Bool = true;
    x: Int?;
}

contract TestContract {
    data: Outer = Outer{i: Inner{a: 42, b: false}, flag: true, x: null};

    init() {
        self.data = Outer{i: Inner{a: 1, b: true}, flag: false, x: null};
    }

    receive() {
        let _ = self.data;
    }
}