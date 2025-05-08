struct Inner1 {
    foo: Int;
}
struct Inner2 {
    bar: String;
}

struct Outer {
    i1: Inner1;
    i2: Inner2;
}

contract MultiNested {
    field: Outer;

    init() {
        self.field = Outer{
            i1: Inner1{foo:7},
            i2: Inner2{bar:"hello"},
        };
    }
}