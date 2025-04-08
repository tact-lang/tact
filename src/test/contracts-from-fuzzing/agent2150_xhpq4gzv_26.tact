// Testing nullable struct inside nullable struct edge
struct Inner {
    val: Int;
}

struct Outer {
    i: Inner?;
}

contract TestContract {
    f: Outer?;
    init() {
        self.f = null;
    }
}