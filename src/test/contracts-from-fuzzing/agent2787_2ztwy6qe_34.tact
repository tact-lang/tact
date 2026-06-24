struct Inner {
    f1: Int? = null;
    f2: Bool? = false;
}

struct Outer {
    a: Inner?;
}

contract DefOpt {
    state: Outer?;

    init() {
        self.state = Outer{
            a: Inner{ f1: null, f2: null }
        };
    }
}
