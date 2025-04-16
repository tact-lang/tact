struct Leaf {
    val: Int;
}

struct Middle {
    leafOpt: Leaf?;
    b: Bool;
}

struct Outer {
    midOpt: Middle?;
    label: String;
}

contract TestContract {
    nested: Outer;

    init() {
        self.nested = Outer{
            midOpt: null,
            label: "opt nested opt struct"
        };
    }
}