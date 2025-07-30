struct Deep {
    a: Int?;
    b: String?;
    c: Bool?;
}

struct Outer {
    nested: Deep;
    label: String;
}

contract ManyNestedOpts {
    val: Outer;
    init() {
        self.val = Outer{
            nested: Deep{a: null, b: null, c: null},
            label: "label"
        };
    }
}