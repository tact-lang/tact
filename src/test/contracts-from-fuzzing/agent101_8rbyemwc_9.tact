struct Inner {
    x: Int;
}

struct Outer {
    y: Int;
    z: Inner?;
}

contract TestContract {
    val: Outer;

    init() {
        self.val = Outer{ y: 5, z: null };
    }
}