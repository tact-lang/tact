struct DeepNest {
    a: Int;
    b: String;
    c: Bool;
}

struct Container {
    inner1: DeepNest;
    inner2: DeepNest;
}

contract DeepNestTest {
    nested: Container;

    init() {
        self.nested = Container{
            inner1: DeepNest{a:1,b:"x",c:true},
            inner2: DeepNest{a:2,b:"y",c:false},
        };
    }
}