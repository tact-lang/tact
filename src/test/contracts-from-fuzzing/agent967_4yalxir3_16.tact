struct Outer {
    a: Int;
    nested: InnerOpt2?;
}

struct InnerOpt2 {
    b: String?;
}

contract StructOptionalOfOptional {
    data: Outer;

    init() {
        self.data = Outer{a: 10, nested: null};
    }
}