struct Leaf {
    x: Int?;
    y: String?;
}

struct TreeA {
    a: Leaf?;
    b: Bool?;
}

struct TreeB {
    foo: Int?;
    bar: Leaf?;
    baz: String?;
}

contract TwinTrees {
    first: TreeA;
    second: TreeB;

    init() {
        self.first = TreeA{
            a: null,
            b: null
        };
        self.second = TreeB{
            foo: null,
            bar: null,
            baz: null
        };
    }

    receive() {
        if (self.second.bar != null && self.second.bar!!.y != null) {
            dump(self.second.bar!!.y!!);
        }
    }
}