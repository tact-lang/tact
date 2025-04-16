struct Leaf {
    v: Int;
}

struct Root {
    a: Leaf?;
    b: Leaf?;
    c: Leaf?;
}

contract TestContract {
    data: Root;

    init() {
        self.data = Root{
            a: null,
            b: null,
            c: null
        };
    }

    receive() {
        let _ = self.data.a;
    }
}