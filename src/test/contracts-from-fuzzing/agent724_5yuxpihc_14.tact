struct InnerMost {
    x: Int; 
}

struct Inner2 {
    i: InnerMost; 
}

struct Inner1 {
    i: Inner2;
}

struct Container {
    c1: Inner1;
    c2: Inner1;
}

contract NestedComplex {
    field: Container;

    init() {
        self.field = Container{
            c1: Inner1{i:Inner2{i:InnerMost{x:1}}},
            c2: Inner1{i:Inner2{i:InnerMost{x:2}}}
        };
    }
}