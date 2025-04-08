struct Inner {
    foo: Int;
    bar: Bool;
}

struct Container {
    in1: Inner;
    in2: Inner;
    in3: Inner;
}

contract ManyNestedFields {
    cont: Container;

    init() {
        self.cont = Container{
            in1: Inner{foo: 1, bar:true},
            in2: Inner{foo: 2, bar:false},
            in3: Inner{foo: 3, bar:true}
        };
    }
}