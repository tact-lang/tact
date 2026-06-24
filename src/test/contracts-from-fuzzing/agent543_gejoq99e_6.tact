struct Mid {
    m: Int;
}

struct Outer {
    out: Int;
    nested: Mid?;
}

contract NestedOptionalStructField {
    data: Outer;

    init() {
        self.data = Outer{
            out:42,
            nested:null
        };
    }
}
