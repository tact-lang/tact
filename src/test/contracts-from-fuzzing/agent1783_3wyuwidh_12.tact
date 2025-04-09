struct Inner1 {
    x: Int;
}

struct Inner2 {
    t: Inner1;
}

contract ComplexInit {
    data: Inner2?;
    init() {
        self.data = null;
    }
}
