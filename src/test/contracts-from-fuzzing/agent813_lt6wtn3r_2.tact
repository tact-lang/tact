struct Inner {
    a: Int = 1;
}

struct Outer {
    b: Inner;
}

contract TestContract {
    field: Outer;
    
    init() {
        self.field = Outer{ b: Inner{} };
    }
}