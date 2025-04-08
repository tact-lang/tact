struct Child {
    a: Int;
    b: Bool;
}

struct Middle {
    x: Int;
    child: Child;
}

struct Root {
    y: Bool;
    middle: Middle;
}

contract TreeStructsContract {
    foo: Root;
    init() {
        self.foo = Root{ y:true, middle: Middle{ x:1, child: Child{ a:2, b:false } } };
    }
}