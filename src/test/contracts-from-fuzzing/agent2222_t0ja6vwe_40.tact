struct Inner {
    foo: Int;
    bar: Bool;
}

struct Container {
    one: Inner;
    two: Inner;
    three: Inner;
}

contract NestedMany {
    cont: Container;

    init() {
        self.cont = Container{
            one: Inner{foo:1, bar:true},
            two: Inner{foo:2, bar:false},
            three:Inner{foo:3, bar:true}
        };
    }
}