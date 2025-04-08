struct Inner {
    foo: Int;
}

struct Middle {
    bar: Inner;
}

struct Outer {
    baz: Middle;
}

contract CascadeNested {
    state: Outer;
    
    init() {
        self.state = Outer{
            baz: Middle{
                bar: Inner{foo: 123}
            }
        };
    }
}