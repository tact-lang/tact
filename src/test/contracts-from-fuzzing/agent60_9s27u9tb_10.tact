struct Inner {
    foo: Int;
    bar: Bool;
}

struct Container {
    a: Inner;
    b: Inner;
    c: Inner;
    d: Inner;
    e: Inner;
    f: Inner;
    g: Inner;
    h: Inner;
    i: Inner;
    j: Inner;
}

contract TestContract {
    cont: Container;

    init() {
        self.cont = Container{
            a: Inner{foo:1,bar:true},
            b: Inner{foo:2,bar:false},
            c: Inner{foo:3,bar:true},
            d: Inner{foo:4,bar:false},
            e: Inner{foo:5,bar:true},
            f: Inner{foo:6,bar:false},
            g: Inner{foo:7,bar:true},
            h: Inner{foo:8,bar:false},
            i: Inner{foo:9,bar:true},
            j: Inner{foo:10,bar:false}
        };
    }
}