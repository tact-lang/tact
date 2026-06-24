struct HasOptStructs {
    s1: Inner?;
    s2: InnerOpt?;
}

struct Inner {
    foo: Int;
}

struct InnerOpt {
    bar: Bool?;
}

contract ManyOptionals {
    vals: HasOptStructs;

    init() {
        self.vals = HasOptStructs{
            s1: null,
            s2: InnerOpt{ bar: null }
        };
    }
}