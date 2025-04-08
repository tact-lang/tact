// several nested structs with optional top
struct InnerMost {
    val: Int;
}

struct Middle {
    inner: InnerMost?;
}

struct Outer {
    mid: Middle;
}

contract TestContract {
    data: Outer?;

    init() {
        self.data = Outer{mid: Middle{inner: null}};
    }
}