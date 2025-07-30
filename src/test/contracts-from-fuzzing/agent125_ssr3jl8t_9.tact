struct InnerMost {
    value: Int;
}

struct InnerOpt {
    contained: InnerMost?;
}

struct Outer {
    nested: InnerOpt;
}

contract OptionalInsideNested {
    myval: Outer;

    init() {
        self.myval = Outer{
            nested: InnerOpt{ contained: null }
        };
    }
}