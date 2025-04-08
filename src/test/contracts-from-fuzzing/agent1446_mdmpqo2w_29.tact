struct Inner {
    foo: Int;
    bar: String;
}

struct Outer {
    nested: Inner;
}

contract Test {
    storage: Outer;
    opt: Int?;
    opt2: Bool?;
    
    init() {
        self.storage = Outer{ nested: Inner{foo:7, bar:"text"} };
        self.opt = null;
        self.opt2 = true;
    }
}
