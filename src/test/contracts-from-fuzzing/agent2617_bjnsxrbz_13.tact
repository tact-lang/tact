struct Small {
    x: Int;
    y: String;
}

struct DeeplyNested {
    a: Small;
    b: Small;
    c: Small;
    d: Small;
    e: Small;
}

contract ManyNestedStructs {
    nested: DeeplyNested;
    init() {
        self.nested = DeeplyNested{
            a: Small{ x:1, y:"a" },
            b: Small{ x:2, y:"b" },
            c: Small{ x:3, y:"c" },
            d: Small{ x:4, y:"d" },
            e: Small{ x:5, y:"e" }
        };
    }
}