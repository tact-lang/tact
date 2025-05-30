struct MultiInner {
    first: Inner1;
    second: Inner2;
}

struct Inner1 {
    foo: Int;
    opt: Bool?;
}

struct Inner2 {
    bar: String;
    flag: Bool;
}

contract MultiNested {
    nested: MultiInner;

    init() {
        self.nested = MultiInner{
            first: Inner1{foo:1,opt:true},
            second: Inner2{bar:"hello",flag:false}
        };
    }
}