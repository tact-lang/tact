struct Deep {
    a: Int;
    b: Bool;
    c: Inner;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract TestContract {
    deepField: Deep;

    init() {
        self.deepField = Deep{
            a: 5,
            b: false,
            c: Inner{x: 1, y: true}
        };
    }
}