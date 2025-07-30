struct Descendant {
    x: Int;
}

struct Parent {
    a: Int;
    b: Descendant;
}

struct Root {
    c: Parent;
    d: Parent;
}

contract MultiStructsSameType {
    val: Root;
    init() {
        self.val = Root{
            c: Parent{ a:1, b:Descendant{x:2} },
            d: Parent{ a:3, b:Descendant{x:4} }
        };
    }
}