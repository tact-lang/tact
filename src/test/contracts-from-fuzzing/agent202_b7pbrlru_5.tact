struct Sub {
    flag: Bool;
    score: Int?;
}

struct Container {
    foo: Int;
    nested: Sub;
    opt: Sub?;
}

contract NestedOptionals {
    st: Container;
    init() {
        self.st = Container{
            foo: 2,
            nested: Sub{ flag: true, score: null },
            opt: null
        };
    }
    receive() {
        let _ = self.st.foo;
    }
}