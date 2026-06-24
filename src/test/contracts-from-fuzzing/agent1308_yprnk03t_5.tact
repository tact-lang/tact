struct Inner {
    flag: Bool;
    val: Int?;
}

struct Outer {
    inner1: Inner;
    inner2: Inner;
    status: Bool?;
}

contract TestContract {
    field: Outer?;

    init() {
        self.field = null;
    }
}