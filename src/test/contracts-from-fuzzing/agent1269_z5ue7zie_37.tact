// Optional inside struct with a default to null, assign non-null instance
struct Inner {
    x: Int;
}

struct Outer {
    inr: Inner? = null;
}

contract TestContract {
    field: Outer;
    init() {
        self.field = Outer{inr: Inner{x:77}};
    }
}