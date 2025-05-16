// nested structs where inner has default, outer does not
struct Inner {
    val: Int = 7;
}

struct Outer {
    inr: Inner;
}

contract DefaultInner {
    state: Outer;

    init() {
        self.state = Outer{ inr: Inner{} };
    }
}