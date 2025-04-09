struct Inner {
    foo: Int; 
    bar: Bool;
}

struct Middle {
    nested: Inner;
    optVal: String?;
}

contract Test2 {
    m: Middle;

    init() {
        self.m = Middle{
            nested: Inner{foo: 5, bar: true},
            optVal: null
        };
    }
}