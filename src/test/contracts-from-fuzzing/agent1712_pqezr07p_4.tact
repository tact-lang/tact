struct Inner {
    q: Int;
}

struct Outer {
    p: Int;
    nested: Inner?;
}

contract TestContract {
    data: Outer = Outer{ p: 1, nested: null };

    init() {
        self.data = Outer{ p: 42, nested: null };
    }

    receive() {
        if (self.data.nested != null) {
            let _ = self.data.nested!!.q;
        }
    }
}