struct Inner {
    a: Int; 
    b: Int;
}

struct Container {
    first: Inner;
    opt: Inner?;
    second: Inner;
}

contract OptionalCenter {
    c: Container;
    init() {
        self.c = Container {
            first: Inner{a:1,b:2},
            opt: null,
            second: Inner{a:3,b:4}
        };
    }
}