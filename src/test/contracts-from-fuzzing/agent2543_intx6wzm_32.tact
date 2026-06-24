struct Deep {
    a: Int;
    b: String;
    c: Bool;
}

struct Middle {
    deep: Deep;
    optDeep: Deep?;
    s: String;
}

contract MixNested {
    f: Middle;
    init() {
        self.f = Middle{
            deep: Deep { a:1, b:"x", c:true },
            optDeep: null,
            s:"z"
        };
    }
}