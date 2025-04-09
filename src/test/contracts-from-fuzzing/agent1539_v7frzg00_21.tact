struct InnerA {
    a: Int;
    b: Bool;
}

struct InnerB {
    c: Int;
    d: String;
}

struct Container {
    x: InnerA;
    y: InnerB;
}

contract NestedStructVars {
    data: Container;
    init() {
        self.data = Container{
            x: InnerA{a:1, b:true},
            y: InnerB{c:2, d:"ok"}
        };
    }
}