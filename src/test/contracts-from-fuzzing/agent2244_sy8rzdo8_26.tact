struct N {
    a: Int;
    b: Bool;
}

contract MultiVars {
    foo: N;
    bar: N;
    baz: N;

    init() {
        self.foo = N{a:1,b:true};
        self.bar = N{a:2,b:false};
        self.baz = N{a:3,b:true};
    }
}