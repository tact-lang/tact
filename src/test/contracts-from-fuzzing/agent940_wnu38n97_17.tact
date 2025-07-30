struct One {
    a: Int;
}

struct Two {
    b: One;
}

struct Three {
    c: Two;
}

struct Four {
    d: Three;
}

contract TestContract {
    val: Four;

    init() {
        self.val = Four{ d: Three{ c: Two{ b: One{ a: 77 } } } };
    }
}