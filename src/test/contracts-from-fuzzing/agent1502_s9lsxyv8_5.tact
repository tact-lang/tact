struct Inner {
    x: Int;
}

struct Outer {
    child: Inner?;
    val: Bool;
}

contract TestContract {
    s: Outer;
    init() {
        self.s = Outer{
            child: null,
            val: false
        };
    }
}