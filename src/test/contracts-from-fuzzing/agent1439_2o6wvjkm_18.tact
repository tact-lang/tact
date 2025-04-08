struct Inner {
    foo: Int?;
    bar: String;
}

struct Outer {
    inner: Inner;
    desc: String;
}

contract OneMoreNested {
    o: Outer;
    init() {
        self.o = Outer{inner: Inner{foo:null, bar:"hello"}, desc:"outer"};
    }
}