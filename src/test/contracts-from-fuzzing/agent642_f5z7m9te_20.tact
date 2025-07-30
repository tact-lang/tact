// testing missing nested initializer edge case
struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    a: Int;
    b: Inner;
}

contract TestContract {
    val: Outer;

    init() {
        self.val = Outer{ a: 7, b: Inner{ x: 10, y: true } };
    }
}