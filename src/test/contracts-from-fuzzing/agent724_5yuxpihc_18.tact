struct Sub {
    a: Int;
    b: Int;
}

struct Wrap {
    x: Sub;
    y: Int;
}

contract WrappedStruct {
    foo: Wrap;

    init() {
        self.foo = Wrap{x:Sub{a:1,b:2}, y:3};
    }
}