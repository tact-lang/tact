struct T {
    a: Int;
}

struct U {
    t: T?;
}

struct V {
    u: U?;
}

contract TestContract {
    v: V;

    init() {
        self.v = V{ u:null };
    }

    receive() {
        self.v = V{ u: U{ t: T{ a:5 } } };
    }
}